---
date: 2024-04-12
title: "Ensuring KEcoLab Stability: Introducing Dedicated CI-Test"
categories: [SoK, KEcoLab, Energy Efficiency, Sustainable Software Goal]
author: Sarthak Negi
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
- SPDX-FileCopyrightText: 2024 Sarthak Negi <sarthaknegi908@gmail.com>
---

<CONTENT>

KEcoLab, a tool for measuring software energy consumption, needs robust testing to ensure its functionality after every code change. This blog post presents the work I did in Season of KDE 2024 implementing dedicated test builds using Kate test scripts to achieve this goal. By implementing a dedicated "test-build" and "integration" stage within the CI/CD pipeline, we can enhance KEcoLab's reliability and maintain confidence in its results.

{{< container class="text-center" >}}

![Setting up CI test (image from Sarthak Negi published under a [CC-BY-4.0](https://spdx.org/licenses/CC-BY-4.0.html) license).](/blog/images/ciimage.png)

{{< /container >}}

### Background

KEcoLab simplifies the process of analyzing KDE software's energy consumption through the CI/CD pipeline in Invent. This automation streamlines the measurement process, offering crucial insights for developers and helping projects seeking eco-certification. However, ensuring KEcoLab's continued effectiveness requires thorough testing after each code modification.

### The Challenge

KEcoLab retrieves the package name from the merge request for testing purposes. However, this approach doesn't guarantee stability after code changes unrelated to specific packages. To address this, we propose a dedicated "test-build" stage within the CI/CD pipeline.

### The Solution: Dedicated Test Builds

The proposed "test-build" stage leverages Kate test scripts located in the [KEcoLab repository](https://invent.kde.org/teams/eco/remote-eco-lab/-/tree/master/scripts/test_scripts/org.kde.kate). These scripts will be instrumental in mimicking CI tests and validating KEcoLab's functionality.

***Here's a breakdown of the proposed stages within the test build:***

#### Stage: test-build

- Tag: test-build 

- Function: This stage functions similarly to how the existing KEcoLab pipeline operates. However, instead of dynamically retrieving the package name, it will be hardcoded to org.kde.kate (as this is the specific package we're focusing on for testing).

- Key Difference: This stage won't rely on files from the merge request. Instead, it will clone the KEcoLab repository to access the necessary Kate usage scenario files. This ensures we're testing against the latest codebase in the repository, regardless of specific merge requests.

- Implementation: To improve code organization and maintainability, we've adopted a modular approach to CI/CD pipelines. We now have two dedicated YAML files:

  - ***.test-energy_measurement.yml***: This file defines the stages for the CI test pipeline.
  - ***.energy_measurement.yml***: This file contains the stages previously defined in .gitlab-ci.yml. All the code related to energy measurement testing has been shifted to this new file.

  Both YAML files reside within the same directory for easy management. The main .gitlab-ci.yml file utilizes the   include keyword to incorporate the stages from these dedicated files. This promotes modularity, improves readability, and reduces redundancy in the main pipeline configuration.

```yml
# Test-build stage
test-build:
  stage: test-build
  image: alpine
  tags:
    - EcoLabWorker
  before_script:
    # Hardcode the package name to org.kde.kate
    - PACKAGE_NAME="org.kde.kate"
  script:
    # Add flathub remote if not exists
    - flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    # Install the specified package (org.kde.kate) from flathub
    - flatpak install --user $PACKAGE_NAME -y
    # Clone the KEcolab repository to access usage scenario files
    - git clone https://invent.kde.org/teams/eco/remote-eco-lab.git
    # Copy the kate usage scenario files from the cloned repository to the required location
    - cp remote-eco-lab/scripts/test_scripts/org.kde.kate/* scripts/test_scripts/org.kde.kate/
  rules:
    - if: $CI_PIPELINE_SOURCE == 'merge_request_event'
```


#### Stage: test-energy-measurement

- This stage operates identically to the existing KEcoLab pipeline stage for energy measurement.

#### Stage: test-report

- This stage also functions identically to the existing KEcoLab pipeline stage responsible for generating reports.

## Future OutLook

#### Stage: integration test

***We introduce a novel integration test*** 

- This stage aims to compare reports generated during the test build with previous reports. By utilizing the `diff` command, we can identify significant discrepancies between the reports. This helps us detect potential regressions or unintended changes in how KEcoLab measures energy consumption.

```yml
# This stage is for integration tests
stage: Integration test

# Jobs to be executed in this stage
jobs:
  - run:
      # Replace with your actual script to run integration tests
      name: Run integration tests
      script: your_test_script.sh

  # Diff reports job (assuming reports are stored in artifacts)
  - diff_reports:
      # Retrieve artifacts from previous job
      stage: Integration test
      artifacts:
        paths:
          - reports/
      script: |
        # Install diff tools 
        apk add diffutils

        # Get the latest reports from artifacts
        report1=$(ls reports/*.html | sort -r | head -n 1)
        report2=$(ls reports/*.html | sort -r | head -n 2)
```

### Why it matters

- ***Enhanced Stability***: By focusing on a specific package (org.kde.kate) and utilizing the latest codebase from the KEcoLab repository, we ensure comprehensive testing across code changes, not just those within a particular merge request.

- ***Catch Bugs Early***: The integration test utilizing `diff` allows for the early detection of regressions or deviations in energy measurement behavior. This proactive approach helps maintain consistent and reliable results from KEcoLab.

- ***Confidence in Every Change***: Whenever someone contributes code, passing tests ensure those changes don't disrupt existing features. This builds trust and keeps development smooth.

- ***Save Time, Be Awesome***: Automating tests frees up valuable time for developers to focus on innovation. We can spend less time debugging and more time making KEcoLab even better!

{{< container class="text-center" >}}

![CI testing (image from Sarthak Negi published under a [CC-BY-4.0](https://spdx.org/licenses/CC-BY-4.0.html) license).](/blog/images/pipeline.png)

{{< /container >}}

### So, How Will It Work?

We have existing test scripts used for Kate, KDE's text editor. We'll first see if these can be adapted for KEcoLab. If needed, we'll create new tests specifically designed for KEcoLab's functionalities.

Here's the coolest part: these tests will become part of our CI/CD pipeline. Whenever someone submits code changes (a merge request), the pipeline will automatically run the tests. If everything passes, the changes are merged with manual approval by the maintainers. But if a test fails, it'll be like a flashing red light, prompting us to fix the issue before merging.

The proposed dedicated test build approach using Kate test scripts is a valuable addition to the KEcoLab CI/CD pipeline. This enhanced testing strategy helps ensure that KEcoLab continues to deliver accurate and reliable software energy consumption measurements, ultimately leading to more efficient and eco-friendly code.

 ### Interested in Contributing?

By implementing dedicated CI-tests leveraging Kate's existing test scripts, we're taking a big step towards solidifying KEcoLab's stability and ensuring the accuracy of its software energy consumption measurements. This wouldn't be possible without the incredible support of the KDE community and my mentors @[karan](https://invent.kde.org/drquark) @[joseph](https://invent.kde.org/joseph). Their dedication to open-source development is truly inspiring.

**Want to See More?** Head over to [KEcoLab](https://invent.kde.org/teams/eco/remote-eco-lab) on invent.kde.org to explore the project, learn more about its development, and check out the [merge request](https://invent.kde.org/teams/eco/remote-eco-lab/-/merge_requests/38) that sparked this advancement!

We're excited about this approach and would love to hear your thoughts! If you're interested in contributing to KEcoLab's development and helping make software development a more sustainable practice, you are always welcome.       Together, we can make a real difference!
