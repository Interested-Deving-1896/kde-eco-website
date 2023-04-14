---
date: 2023-04-14
title: 'Season Of KDE 2023 With KDE Eco: Improvements To KdeEcoTest'
categories: [SOK23, KdeEcoTest, xdotool, pynput, Kate, GCompris, KDE Eco]
author: Mohamed Ibrahim
summary: 'My experience improving the KdeEcoTest tool, an automation tool that simulates computer actions when measuring the energy consumption of software.'
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
- SPDX-FileCopyrightText: 2023 Mohamed Ibrahim <@hemasonus01:matrix.org>
---

Being a part of the KDE community in the Season of KDE 2023 and contributing to this exceptional Free & Open Source project is a great experience for me. I am grateful to the KDE community for giving me this opportunity to contribute.

### About Me

I am Mohamed Ibrahim, a 4th year student of systems and biomedical engineering at Cairo University, Egypt. I have experience in different domains of building software, such as web development, computer vision, digital signal processing, and embedded systems for biomedical applications. I also have some professional experience as a member of a team in the fintech industry. I find Free & Open Source Software very interesting and I am happy to start my journey with FOSS by contributing to KDE.


### KdeEcoTest Improvements

The idea behind [`KdeEcoTest`](https://invent.kde.org/teams/eco/feep/-/tree/master/tools/KdeEcoTest) is to provide a tool for building Standard Usage Scenario scripts and then running them when measuring the energy consumption of software. How KdeEcoTest works is very simple: first, run the CLI tool, which acts as a test controller; and second, open the target application and enable the recording of actions. This way a script containing the usage scenario is created which can be used to run the scenario again in a measurement lab, such as the one at [KDAB Berlin](https://eco.kde.org/blog/2022-07-25-sprint-lab-follow-up/).


{{< video src="/blog/videos/blog_ex1_fast.mp4?raw=1" controls=true autoplay=false loop=false >}}

{{< container class="text-center" >}}
Video: Example of a simple usage scenario for GCompris. (Video from Mohamed Ibrahim published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)
{{< /container >}}


Creating a Standard Usage Scenario is challenging. User interactions are complex, for example, doing single or double mouse clicks, right clicks, scrolling , dragging, typing, keyboard shortcuts, and interacting with modal windows or pop ups.

Thanks to [Emmanuel Charruau](https://invent.kde.org/echarruau) and [Karanjot Singh](https://invent.kde.org/drquark), who developed the base code for creating, parsing, and running scenario scripts by adding support for mouse clicks and writing text to screen (taking input from the CLI) using `xdotool` and `pynput`.

During SoK23 I worked on the following in order to enhance the functionality of `KdeEcoTest`: refactoring, new CLI and repeat actions, modal window support, [`OSCAR`](https://oscar.umwelt-campus.de/) formatting & runtime logs, keyboard support, and mouse drag. I will discuss each below.

#### Refactoring

For `KdeEcoTest` to grow and support more features, it is necessary to refactor the code to make sure that the design is extensible. So I started refactoring the runner part first by breaking down the code into smaller modules that have a single responsibility. As shown below, the `Runner` module depends on the `Parser` which depends on the `Actions`. Whenerver the `Runner` starts it creates a test `Context` that holds the necessary info to execute the scripts. Also I made sure that the code is fully typed with python hints and did the setup of dependency management with [`pipenv`](https://pypi.org/project/pipenv/), and then applied [`Black`](https://pypi.org/project/black/) to ensure a consistent style guide. All of this will help make the code more maintainable and easy to extend.

{{< container class="text-center" >}}
![The old and new design of KdeEcoTest. (Image from Mohamed Ibrahim published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)](/blog/images/KdeEcoTestDesign.png)
{{< /container >}}

#### New CLI & Repeat Action

I made a new CLI interface with [`Typer`](https://typer.tiangolo.com/) to simplify running and packaging `KdeEcoTest`. Now a single CLI can run both the 2 modes (creating, running) scenario scripts instead of 2 separate ones.

The `Repeat` action is a helper functionality that enables running actions multiple times within the script, which is necessary for obtaining reliable data for the energy consumption of an application.

#### Modal Window Support

I also worked on adding support for performing actions in modal windows which appear while running tests. For example, clicking open or save in the [`Kate`](https://apps.kde.org/kate/) editor opens the file explorer window. Now, the runner can click in those modal windows.

{{< video src="/blog/videos/kate_plasma_modal.mp4" controls=true autoplay=false loop=false >}}

{{< container class="text-center" >}}
Video: Example of modal window click in Kate. (Video from Mohamed Ibrahim published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)
{{< /container >}}

#### OSCAR Formatting & Runtime Logs

In order to measure software performance, we need to correlate the energy consumption data with the actions being done. To [generate reports for `OSCAR`](https://eco.kde.org/handbook/#analysis-of-the-results-with-oscar)&mdash;a useful tool from the [Environmental Campus Birkenfeld](https://en.wikipedia.org/wiki/Environmental_Campus_Birkenfeld) (German: *Umwelt Campus Birkenfeld*) for generating energy consumption reports&mdash;logs have to be in a specific format, and I made sure that the logs meet that format. I also added formatted runtime logs for the runner using the [`Loguru`](https://pypi.org/project/loguru/) package, which includes a time stamp when the action is initiated by the script and logs comments in the script associated with that action. We can see the formatted runtime logs in the videos above. Below is an example for the [`GCompris`](https://apps.kde.org/gcompris/) children's educational software scenario script.

{{< container class="text-center" >}}
![Sample of OSCAR-formatted log file from the GCompris script. (Image from Mohamed Ibrahim published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)](/blog/images/oscar-log-sample.png)
{{< /container >}}

#### Keyboard Support
I worked on supporting the recording of keyboard activity while building the usage scenario script and running those keyboard actions in the target test window again. Currently, KdeEcoTest supports almost all keyboard keys including aA-zZ, arrows, backspace, enter, and special characters.

{{< video src="/blog/videos/gcompris_keyboard_sped_up.mp4?raw=1" controls=true autoplay=false loop=false >}}

{{< container class="text-center" >}}
Video: Keyboard activity for Gcompris. (Video from Mohamed Ibrahim published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)
{{< /container >}}

#### Mouse Drag

I added mouse-dragging functionality by making users select a start and end point to perform a drag while building the script. While running the script, mouse dragging is simulated between the specified points, as shown in the example below.

{{< video src="/blog/videos/gcompris_drag.mp4?raw=1" controls=true autoplay=false loop=false >}}

{{< container class="text-center" >}}
Video: Drag mouse simulation in GCompris. (Video from Mohamed Ibrahim published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)
{{< /container >}}

### Current Challenges

I have made many improvements to KdeEcoTest, but there are still several challenges and problems to solve.

- Sharing scripts across systems is still a challenge hard due to different system configurations or hardware. For example, we faced a problem sharing a script for GCompris between 2 machines with different screen resolutions. The problem is GCompris uses the primary screen resolution to calculate the size of icons, which made the script invalid due to the resulting UI changes. Currently, we have been able to solve this by using virtual machines configured with the same screen resolution.

- Running scripts multiple times is tricky because the recorded scenario may change something in the configuration of the UI, so next time the script is run it will not work due to these changes. This can be solved by removing any side effects made by running a test script, such as using a clean-up bash script. Currently, this is done manually, but it can be integrated into KdeEcoTest, for example, by passing an argument to a clean-up script.

- The way of recording mouse dragging (i.e., selecting a start and end point) is not convenient. It would be better to detect that the user did a drag directly while recording actions.

- Keyboard shortcuts are still not supported. Only typing characters is supported.

- The test creator still needs refactoring as discussed above. It also can be developed into an interactive CLI or even a GUI.

### Conclusion

I learned a lot while contributing to KdeEcoTest and I hope this project continues and becomes even better in the future. Thanks a lot to my mentors [Emmanuel Charruau](https://invent.kde.org/echarruau), [Karanjot Singh](https://invent.kde.org/drquark), and [Joseph P. De Veaugh-Geiss](https://invent.kde.org/joseph).
