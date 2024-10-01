---
date: 2024-03-28
title: "KEcoLab in SoK24: Incorporating Energy-Consumption Measurements In The CI/CD Pipeline"
categories: [SoK, KEcoLab, Energy Efficiency, Sustainable Software Goal]
author: Aakarsh MJ
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
- SPDX-FileCopyrightText: 2024 Aakarsh MJ <mj.akarsh@gmail.com>
---

## KEcoLab
Sustainability has been one of three goals at KDE over the past 2 years. One aspect of this goal is to measure the energy consumption of KDE software. To do this, it is necessary to access the lab in KDAB, Berlin, which can now be done remotely using KEcoLab.

{{< container class="text-center" >}}

![Testing and debugging Okular scripts on a Virtual Machine host (image from Aakarsh MJ published under a [CC-BY-4.0](https://spdx.org/licenses/CC-BY-4.0.html) license).](/blog/images/2024-03-28-sok24-energy_measurement_lab-okularScripts.gif)

{{< /container >}}

KEcoLab (remote-eco-lab) is a KDE Eco project aimed at enabling remote energy consumption measurements for your software using Gitlab's CI/CD pipeline. By automating the measurement process and integrating with the [OSCAR](https://oscar.umwelt-campus.de/) statistics tool, developers can make informed decisions about improving code efficiency and obtain software eco-certification with the [Blue Angel](https://www.blauer-engel.de/en/productworld/resources-and-energy-efficient-software-products). This project came to being as part of [GSoC 2023](https://eco.kde.org/blog/2023-06-13-gsoc23-energy-measurement-lab/) under the mentorship of Volker Krause, Benson Muite, Nicolas Fella and Joseph P. De Veaugh-Geiss. Karanjot Singh is its original developer.

One of the main aims of Season of KDE 2024 is to integrate KEcoLab into Okular's pipeline. Okular is KDE's popular multi-platform PDF reader and universal document viewer. In 2022, Okular was awarded the [Blue Angel ecolabel](https://eco.kde.org/blog/2022-03-16-press-release-okular-blue-angel/), the first ever eco-certified computer program. You can learn more about KDE Eco [here](https://eco.kde.org/) and the process of measuring energy consumption in the [KDE Eco handbook](https://eco.kde.org/handbook/).

## Deliverables Of The SoK24 Project
1. Integrate KEcoLab into Okular's pipeline.
2. Integrate KEcoLab's pipeline with E2E tests or integration tests.
3. Usage scenario scripts with KdeEcoTest.
4. Bug squashing.

I have been working together with Sarthak Negi for this Season of KDE.

## Integrating KEcoLab Into Okular's Pipeline
As mentioned, the main aim for this mentorship is to integrate KEcoLab into Okular's pipeline. Okular, being a Blue Angel certified project, will benefit from having its energy consumption measured either for every release automatically or for specific merge requests via a manual trigger. In this way it is possible to track Okular's energy consumption and make necessary changes to adhere to Blue Angel specifications.

I have had discussions with the Okular team regarding the integration of KEcoLab into their pipeline. This was necessary to make sure that the new addition won't change their existing workflow rules, i.e., there would be no manual work required on their end to trigger the pipeline on every release. At the same time, we wanted to make sure it is possible to manually trigger the measurement process on a case-by-case basis. I'll go into further details below. The email exchange can be accessed [here](https://www.mail-archive.com/okular-devel@kde.org/msg44681.html). 

I have been testing the pipeline on a test-repo for the past few weeks, which can be accessed [here](https://invent.kde.org/aakarshmj/test-repo).

The pipeline was tested for the following contexts:
1. Triggering KEcoLab's pipeline for energy measurement:

    a) using Web UI.
    
    b) pushing the tag through Git.
2. Pipeline runs on triggering it manually through the Web UI.
3. Pipeline does not run on merge request.
4. Prevent pipeline from running on every commit push.

The above was achieved by making use of a combination of GitLab's `workflow: rules` and GitLab's predefined CI/CD variables. There were several difficulties I faced during this time, notably preventing the pipeline from running on every release and rather restricting it to only major releases. During one of the monthly meetings, however, Volker thought this would not be necessary since there is only one release per month, i.e, for the time being it is not important to cherry pick the release candidates. As it is now, the measurement process will therefore be triggered on every release of Okular. This may change at a later date, and so I will document here some thoughts I had on how to this.

I initially thought about making use of a global variable which would be updated in the .pre stage depending on a comparison between the last and second-to-last tag to determine whether it's a major or minor release. This would be achieved by making use of a regex rule to identify the difference. The way this would work is by adding a rule under every job to check for the value of the variable. However, since the value wasn't persistent, I took a different approach by making use of artefacts which would contain the value required to determine if it's a major or a minor release version. When a measurement should be triggered, and when not, looks something like this:

- v1.8.3 -> v2.0.8 # Pipeline should run

- v2.2.3 -> v2.6.8 # Pipeline should not run

The code looked something like this:
```yaml
check-major-version:
  stage: .pre
  image: alpine
  tags:
    - EcoLabWorker
  before_script:
    - echo "Checking for major version"
  script:
    - export PREV_COMMIT_TAG=$(git tag --sort=-v:refname | grep -A1 '$COMMIT_TAG' | tail -n 1)
    - export MAJOR_VERSION_CURRENT=$(echo $COMMIT_TAG | sed 's/v\([0-9]*\).*/\1/')
    - export MAJOR_VERSION_PREVIOUS=$(echo $PREV_COMMIT_TAG | sed 's/v\([0-9]*\).*/\1/')
    - if [ "$MAJOR_VERSION_CURRENT" == "$MAJOR_VERSION_PREVIOUS" ]; then IS_MAJOR_RELEASE="false" > release_info.env; fi
  artifacts:
    reports:
      dotenv: release_info.env
```

Once I started testing it, I realised that the value of the updated global variable did not persist across jobs. Therefore, using the variable to determine whether the job should run or not was not viable. Additionally, I realized that this approach would still cause the pipeline to run and in any case it would result in a failed pipeline if all the jobs did not run. Since we decided the measurement process can run on every release, I abandoned trying to implement this.

Currently the pipeline is being tested on my fork of Okular [here](https://invent.kde.org/aakarshmj/okular/-/jobs). It's almost ready, we just need to add the test scripts under 'remote-eco-lab/scripts/test-scripts/org.kde.okular' for which [this patch](https://invent.kde.org/teams/eco/remote-eco-lab/-/merge_requests/33) has been made.


{{< container class="text-center" >}}

![Testing Okular in KEcolab (image from Aakarsh MJ published under a [CC-BY-4.0](https://spdx.org/licenses/CC-BY-4.0.html) license).](/blog/images/2024-03-28-sok24-energy_measurement_lab.png)

{{< /container >}}

## Bug Squashing
This includes the following:
#### Updating The Test Script To Comply With The Latest Kate Version (Issue [!23](https://invent.kde.org/teams/eco/remote-eco-lab/-/merge_requests/23))

Kate was one of the first application that KEcoLab had test scripts for. Even though we made use of as many shortcuts as possible, we were still using tabs to navigate around the user interface. This caused a problem: the previous script was made on Kate v21, and with Kate v24 being released the script needed to be updated accordingly. Also, testing the script across different distros highlighted a shortcoming of a bash-script approach: on Ubuntu the file was not being saved as intended, whereas on Fedora the file was being saved. In other words, small differences had potentially significant impacts which could make the script fail. In fact, it is one of the more fragile aspects of this approach to usage scenario scripting, which a semantics-based tool like [Selenium](https://eco.kde.org/blog/2023-05-04-sok23-kde-eco-selenium-sum-up/) doesn't have. 

{{< container class="text-center" >}}

![Testing Kate scripts on a Virtual Machine host (image from Aakarsh MJ published under a [CC-BY-4.0](https://spdx.org/licenses/CC-BY-4.0.html) license).](/blog/images/2024-03-28-sok24-energy_measurement_lab-kateScripts.gif)

{{< /container >}}

#### Helping Debug A Test Script On The Remote Lab PC (Issue [!29](https://invent.kde.org/teams/eco/remote-eco-lab/-/merge_requests/29))

There is a usage scenario script that is failing on the System Under Test. Worse yet, we do not know why and currently have no way to visually monitor the issue. This is a real pain point, mainly because we are unsure what may be the underlying problem. The script simulating user behavior doesn't seem to exit after completion, resulting in the lab being stuck in an endless loop. It is only exited when the GitLab runner times out. Since we don't yet have visual output of what is happening on the System Under Test, we are setting up a VNC to monitor what is happening. If anyone is interested in helping debug this, take a look at the remote eco lab job [here](https://invent.kde.org/xiscof/remote-eco-lab/-/jobs). Also, check out the discussion at [this issue](https://invent.kde.org/teams/eco/remote-eco-lab/-/issues/13) regarding the visual monitoring of what is happening on the remote lab PC. 

{{< container class="text-center" >}}

![Testing scripts running remotely on the System Under Test in the measurement lab at KDAB, Berlin (image from Aakarsh MJ published under a [CC-BY-4.0](https://spdx.org/licenses/CC-BY-4.0.html) license).](/blog/images/2024-03-28-sok24-energy_measurement_lab-libreofficeScripts.gif)

{{< /container >}}

#### Test Out And Update The SUS Scripts For Okular In The FEEP Repository (Issue [!52](https://invent.kde.org/teams/eco/feep/-/merge_requests/52))

This mainly involved testing the script and cross-checking everything works. In this case, the shortcuts defined at the very top weren't consistent with the shortcuts used by the script.

## Looking To The Future Of KEcoLab
1. Usage scenario scripts with KdeEcoTest. 
Since `KdeEcoTest` now supports Wayland thanks to [Athul Raj](https://eco.kde.org/blog/2024-02-20-sok24-wayland_support_kdeecotest/) and runs on Windows thanks to [Amartya Chakraborty](https://eco.kde.org/blog/2024-02-20-windows-kdeecotest-support/), we can utilize this tool to further enhance the remote lab. The current bash scripts are based on `xdotool`, which only supports X11 and not Wayland and does not run on Windows. With Plasma 6 now supporting Wayland by default, and many KDE apps being available on Windows, including Okular, this seems to be the right next step for KEcoLab tooling. 

2. Setting up a VNC to monitor scripts visually.
The problems faced by us have put further emphasis on the need to be able to monitor what is or is not happening on the remote System Under Test. This was also previously considered. From Joseph's notes, based on work done by Nicolas Fella during one of the [lab setup](https://eco.kde.org/blog/2022-05-30-sprint-lab-setup/) [sprints](https://eco.kde.org/blog/2022-07-25-sprint-lab-follow-up/), the following approach can be utilized:

```
# VNC/remote desktop access

## Server Install

- apt install tigervnc-standalone-server
- echo "kwin_x11 &" >> .vnc/xstartup
- echo "konsole" >> .vnc/xstartup

## Start Server
- tigervncserver -geometry 1920x1080

## Client
create SSH tunnel:
- ssh -N -L 5900:localhost:5901 kde@INSERT_IP_HERE

In VNC client, e.g. KRDC:
- connect to localhost:5900

It will start a single Konsole window. Use this to start other stuff

```

If this doesn't work, we may want to reference [x11vnc](https://github.com/LibVNC/x11vnc). If anyone has successfully setup VNC before, feel free to reach out as we would appreciate your help!

## Interested in Contributing?
If you are interested in contributing to KEcoLab, you can join the matrix channels [Energy Measurement Lab](https://matrix.to/#/#kde-eco-dev:kde.org) and [KDE Energy Efficiency](https://matrix.to/#/#energy-efficiency:kde.org) and introduce yourself.
KEcoLab is hosted [here](https://invent.kde.org/teams/eco/remote-eco-lab).
Thank you to Karan and Joseph as well as the whole KDE e.V. and the wonderful KDE community for helping out with this project.
You can also reach out to me via [email](mj.akarsh@gmail.com) or on [Matrix](https://go.kde.org/matrix/#/@aakarshmj:matrix.org)