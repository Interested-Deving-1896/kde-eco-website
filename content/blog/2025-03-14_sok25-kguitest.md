---
date: 2025-03-26
title: "KdeGuiTest (KdeEcoTest) in SoK25: Debugging, Building an Interactive User Interface, and More"
categories:  [SoK, Sustainability, KDE Eco, KdeEcoTest, KdeGuiTest, KEcoLab]
author: Oreoluwa Oluwasina
summary: Learn more about my work in Season of KDE 2025 debugging issues in KdeGuiTest and creating a graphical user interface for scripting using the tool.
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
---

KdeGuiTest (previously called KdeEcoTest) is an automation and testing tool which allows one to record and simulate user interactions with the GUI of an application. It is being developed as part of the KDE Eco initiative to create usage scenario scripts for measuring the energy consumption of software. The main goals in Season of KDE 2025 are (i) to debug remaining issues, and (ii) to make KdeGuiTest more user-friendly by creating a Graphical User Interface so it is easier to create, edit, and run emulation scripts.

Progress of the KDE season so far:

* Creation of a 4-cross PDF to be used for testing shift coordination.
* Detection of the issues affecting shift coordination.
* Fixed “Platform supported” error due to `pynput`.
* Integration of KdeGuiTest with its own newly-built Graphical User Interface.

### SHIFT COORDINATION ERROR

There is a difference between what is recorded when creating a script and what is played when running the script.

How I planned to fix this:

* Identify the root of the shift error by creating a script to click on four target crosses, and then running the script to locate and solve differences.
* Develop and implement a correction mechanism to accurately map recorded coordinates to playback positions.

My progress so far on the shift error:

1. Creation of the 4-crosses PDF to test shift error: A target PDF is created with 4 crosses horizontally and vertically opposite each other.
     
{{< container class="text-center" >}}
![This is the target PDF used to detect the shift error (image from Oreoluwa Oluwasina published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)](/blog/images/Target_pdf.png)
{{< /container >}}

2. Created a test script on the target PDF to detect shift error: I created a test script that clicks on the four crosses. I tested the KdeGuiTest tool on the target PDF and identified the issues affecting the shift error, namely:

    * Difference in mouse coordinates when scripts are created and playback
    * Screen position
    * Screen resolution

I am still working on a fix for this. See my comments at the end of this post for more.

### FIXED “PLATFORM NOT SUPPORTED” ERROR DUE TO PYNPUT

While creating a script with KdeGuiTest we encountered the error “Platform not supported”. It was not recognizing the `pynput` backend in the code, which is the main technology used in KdeGuiTest to simulate user interactions in software applications. `pynput` is a Python library that allows you to control and monitor input devices. It is used for interacting with your keyboard and mouse through Python code. Read more from Mohamed Ibrahim in SoK23 [here](https://eco.kde.org/blog/2023-04-14-sok23-eco-tester/), Athul Raj K in SoK24 [here](https://eco.kde.org/blog/2024-02-20-sok24-wayland_support_kdeecotest/), and Amartya Chakraborty in SoK24 [here](https://eco.kde.org/blog/2024-02-20-windows-kdeecotest-support/).

The error was fixed by installing the `pynput` package from https://github.com/krathul/pynput and other packages like Rust.


### GRAPHICAL USER INTERFACE FOR KDEGUITEST USING PyQt5

One of the main goals in Season of KDE 2025 is to make KdeGuiTest more user-friendly and have it be easier to create, edit, and run final scripts using a Graphical User Interface.

To better understand the idea of the interface Emmanuel had in mind, I presented a prototype in one of our weekly meetings. Fortunately, it fit the proposed idea! To implement the prototype, I built the GUI from scratch with some feedback from my mentor Emmanuel. [`PyQt5`](https://pypi.org/project/PyQt5/) is used for creating graphical user interfaces with Python. It's a powerful and versatile toolkit that allows developers to build desktop applications that look and feel native on various operating systems, including Windows, macOS, and GNU/Linux.

The GUI has the following features:
* Create script interface
* Buttons for the following commands:
  * `dw` - define window
  * `ac` - add clicks
  * `sc` - stop add clicks
  * `ws` - write to the screen
  * `wtl` - write test timestamp to log
  * `wmtl` - write message to log
* Action buffer widget
* Final script widget
* A run script interface
* File dialog


You can see the current version of the scripting interface below.

{{< container class="text-center" >}}
![This is the create script interface (image from Oreoluwa Oluwasina published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)](/blog/images/Create_script.png)
{{< /container >}}

### LOOKING TO THE FUTURE OF KDEGUITEST

First, fixing the shift error: The main shift error identified is due to differences in mouse coordinates. The mouse coordinates are recorded in the GUI in order to track them. I will then develop and implement a correction mechanism to accurately map recorded coordinates to playback positions.
Second (time-permitting), developing three test scripts in collaboration with [KEcoLab](https://invent.kde.org/sdk/kecolab) to compare energy consumption of PDF readers:

1. GNU/Linux + Okular Script:
  * Open PDF document
  * Simulate typical reading patterns (scrolling, page turns)
  * Test PDF search functionality
  * Change to different view modes (single page, continuous)
  * Measure annotation and highlighting features
  * Document energy consumption metrics

2. Windows + Okular script:
  * Replicate testing scenarios from GNU/Linux + Okular script
  * Adapt window management code for Windows environment
  * Collect equivalent energy consumption data points
    
3. Windows + Adobe Acrobat Script:
  * Mirror the same testing scenarios as Okular script for a direct comparison
  * Account for Adobe Acrobat's specific UI elements and behaviors
  * Test comparable features (navigation, search, annotations)
  * Measure energy consumption patterns



#### Interested In Contributing?

KdeGuiTest is hosted [here](https://invent.kde.org/sdk/kde-gui-test). If you are interested in contributing, you can join the Matrix channels [KdeGuiTest](https://go.kde.org/matrix/#/#kdeecotest:kde.org), [KDE Eco](https://go.kde.org/matrix/#/#kde-eco:kde.org), and [Measurement Lab Development](https://go.kde.org/matrix/#/#kde-eco-dev:kde.org) and introduce yourself. Thank you to the Season of KDE 2025 admin and mentorship team, the [KDE e.V.](https://ev.kde.org/), and the incredible KDE community for supporting this project.

Please feel free to contact me here: <@oree_x:matrix.org>

---
