---
date: 2023-04-12
title: 'Season of KDE 2023 With KDE Eco: "Improvements of KDE ECO Tester"'
categories: [SOK23, KdeEcoTest, xdotool, pynput, Kate, GCompris, KDE Eco]
author: Mohamed Ibrahim
summary: 'My experience of improving KDE ECO Tester tool which is an automation tool that simulate computer actions to help in measuring the energy consumption of software'
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
- SPDX-FileCopyrightText: 2023 Mohamed Ibrahim <@hemasonus01:matrix.org>
---

Being a part of the KDE community in the Season of KDE and contributing to this exceptional Open Source project is a great experience for me, and I express my gratitude to the KDE community for giving me this chance to contribute.

### About Me
I am Mohamed Ibrahim, a 4th year student of systems and biomedical engineering at Cairo University, Egypt. I was exposed to different domains of building software, such as web development, computer vision, digital signal processing, and embedded systems for biomedical applications. I also had some professional experience as a member of a team in the fintech industry. I find open source software very interesting and I am happy to start my journey of open source contribution with KDE. 


### KdeEcoTest Improvements

The idea behind [`KdeEcoTest`](https://invent.kde.org/teams/eco/feep/-/tree/master/tools/KdeEcoTest) is providing a tool for building Standard Usage Scenario scripts and running them to enable measuring the energy consumption of software. How KdeEcoTest works is very simple, first by running the CLI tool which acts as a test controller, second open the target application then enable actions recording and we get a script that contains the scenario done which can be used to run the scenario again with [`KdeEcoTest`](https://invent.kde.org/teams/eco/feep/-/tree/master/tools/KdeEcoTest).

{{< video src="https://dl.dropboxusercontent.com/s/8wav41i2gzho9vy/blog_ex1_fast.mp4?raw=1" controls="false" autoplay="true" loop="true" caption="Example of simple scenario for Gcompris." >}}

{{< container class="text-center" >}}
Video from Mohamed Ibrahim published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.
{{< /container >}}

However creating a real Standard Usage Scenario is challenging as user interactions are complex for example doing single, double mouse clicks, right click , scrolling , dragging, typing, keyboard shortcuts, interacting with modal windows or pop ups.

Thanks to [Emmanuel Charruau](https://invent.kde.org/echarruau) and [Karanjot Singh](https://invent.kde.org/drquark) they built the base code for creating, parsing and running the scenario scripts with adding the support for mouse clicks and writing text to screen (taking input from the cli) using `xdotool` and `pynput`.

In order to enhance KdeEcoTest I worked on the following

#### Refactoring 

As KdeEcoTest will grow and to be able to support more features it is necessary to refactor the code to make sure that the design is extensible. So I started refactoring the runner part first by breaking down the code into smaller modules that have a single responsibility as shown below the parser and actions then creating a test context that holds the need info while executing scripts. Also I made sure that the code is fully typed with python hints and did the setup of dependency management with `pipenv` then applied `black` to ensure a consistent style guide. All of this will help making the code more maintainable and can be extended more. 

{{< container class="text-center" >}}
![The shift of KdeEcoTest old design to the new design. (Image from Mohamed Ibrahim published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)](/blog/images/KdeEcoTestDesign.png)
{{< /container >}}

#### New Cli & Repeat Actions
As a part of improving KdeEcoTest, I made a new CLI interface with `typer` which unifies the usage of the tool instead of running 2 separate file one for running the test and one for creating. Currently it is a single CLI app with 2 commands (create, run), one argument for passing script path and comes with a help menu also.

The Repeat action is a helper action added to the script to be able to run the same test multiple times.

#### Modal window support
I also worked in adding the support of doing actions on modal windows that appear during running tests. For example clicking open or save on Kate editor which will open the file explorer window. Currently the runner can click on those modal windows.


<div style="width: 60%; margin: auto;">
{{< container class="text-center" >}}
![Example of modal window click in kate. (Image from Mohamed Ibrahim published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)](https://dl.dropboxusercontent.com/s/lbytmoaz8fzpavk/kate-plasma.gif?raw=1)
{{< /container >}}
</div>

#### OSCAR format and Runtime Logs
In order to complete the cycle of measuring software performance we needed to compare the consumption of the software being tested with the actions being done which gives more insight. So to help generating reports for [OSCAR](https://eco.kde.org/handbook/#analysis-of-the-results-with-oscar), logs have to be in a specific format, so i made sure that the logs saved meet that format. I also added a formatted runtime logs for the runner using `loguru` package which includes time stamp the position at which the action is fired from the script and any comments from the script also associated with that action. We can see the formatted runtime logs in the videos above, and here is a sample of Gcompris scenario script.


{{< container class="text-center" >}}
![Sample of OSCAR formatted log file from Gcompris script. (Image from Mohamed Ibrahim published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)](/blog/images/oscar-log-sample.png)
{{< /container >}}


#### Keyboard Support
I worked on supporting keyboard activity recording while building the usage scenario script and be able to run those keyboard actions to the target test window again. Currently KdeEcoTest support almost all keyboard keys including (aA-zZ, arrows, backspace, enter, special chars). 


{{< video src="https://dl.dropboxusercontent.com/s/jdr1cdv03go3yf6/gcompris_keyboard_sped_up.mp4?raw=1" controls="true" autoplay="true" loop="true" caption="Keyboard activity for Gcompris." >}}

{{< container class="text-center" >}}
Video from Mohamed Ibrahim published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.
{{< /container >}}


#### Mouse Drag
I added the mouse dragging functionality by making users select a start and end point to do a drag between while building the script. While running the script the mouse dragging is simulated between the specified points, as shown in the example below.


{{< video src="https://dl.dropboxusercontent.com/s/leahul7j1eg316c/gcompris_drag.mp4?raw=1" controls="false" autoplay="true" loop="true" caption="Drag mouse simulation in Gcompris." >}}

{{< container class="text-center" >}}
Video from Mohamed Ibrahim published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.
{{< /container >}}

### Current Challenges
However KdeEcoTest is improved there are a lot of challenges and problems to solve.

- Sharing scripts is hard due to different system and configurations or hardware, for example we faced a problem sharing a script for Gcompris between 2 machines with different screen resolution, the problem is Gcompris uses the primary screen resolution to calculate icons size which made the script invalid due to ui changes. Currently we are solving this by using virtual machines and using same screen resolution.

- Running scripts multiple times is tricky because may the recorded scenario is changing something in configuration of the ui so next time we run the script it won't work because the ui changed from the last time. This can be solved by removing any side effects made by running a test by using a clean bash script this is done manually but can be integrated inside KdeEcoTest for example passing an argument to a clean up script.

- The way of recording mouse dragging is not convenient (selecting start and end point), it would be better to detect that the use did a drag directly while recording actions.

- Keyboard shortcuts still not supported, only typing chars supported

- The test creator still needs refactoring as designed above, it also can be transformed into an interactive CLI or even a GUI.


### Conclusion

I learned a lot while contributing to KdeEcoTest and I hope this project continues and be more better in the future. Thanks a lot to my mentors [Emmanuel Charruau](https://invent.kde.org/echarruau), [Karanjot Singh](https://invent.kde.org/drquark) and [Joseph P. De Veaugh-Geiss](https://invent.kde.org/joseph)
