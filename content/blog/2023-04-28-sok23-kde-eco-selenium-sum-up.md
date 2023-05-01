---
date: 2023-04-20
title: "SOK 2023 Selenium-ST-API Kde Eco Power Measurement Proof of Concept
Achieving three KDE Goals with one stone!"
categories: [SOK23, Selenium, KdeEcoTest, GCompris, AT-SPI]
author: Emmanuel Charruau
summary: How Nitin Tejuja work for SOK 2023 will help Kde towards its goals.
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
  - SPDX-FileCopyrightText: 2023 Emmanuel Charruau <@allon:kde.org>
---

#### Why using Selenium-AT-SPI

Last year, Okular, KDE's advanced document reader, became the first software product ever to receive the Blue Angel eco-label. This certification recognises Okular as having a sustainable software design.

The certification process involves measuring the power consumption of the software executing repetitive actions that simulate human use.
For Okular's certification, this was done using scripts and the xdotools command line tool.
At KDE Eco, we tried to use the GUI tool Actiona to make these tests easier, but it was not flexible enough because it required adding a simple action to open a window, entering a click location, validating your input, and so on, making the process very tedious.
We then developed a Python tool based on xdotools, called KdeEcoTest, which was able to record any user action and translate it into text script.
The advantage of using text-based scripts over creating GUI actions is that using text based actions is much quicker, and you can easily copy/paste/modify any interesting part of the test. This is much more efficient, but it was not enough.

(Image from Emmanuel Charruau published under a [CC-BY-4.0](https://spdx.org/licenses/CC-BY-4.0.html) license.)](images/kdeecotestscreenshot.jpg "KdeEcoTest does not work if the software GUI elements locations are modified.")


The main problem with this approach, which is based on the location of mouse clicks, is that if the software GUI changes (resizing GUI elements, changing screen resolution), the tool can click outside the elements to be tested, and then it does not work.

We needed a tool able to access the GUI element itself, and this is exactly the solution that Harald Sitter posted one day on KDE Planet.


#### What is Selenium-AT-SPI

Selenium-AT-SPI is a modification of the Selenium webdriver. The Selenium webdriver is used to automate tests on browsers, accessing HTML element using its id or name. It is able to click on elements, enter text into input fields, and more.
Selenium-AT-SPI does the same but for Qt programs, accessing the GUI element through its QML accessibility properties.
The tested software interface can be modified, resized, and tested on different screen resolutions. As long as the GUI element are still present, the test will still work.


#### Nitin's Work

Nitin Tejuja SoK's task was to use Selenium-AT-SPI, which is a work in progress, to reproduce a minute-long script created with KdeEcoTest to test several activities of the educational software GCompris.
His work was very efficient, as after a month Nitin was able to
- run Selenium-AT-SPI
- write an installation guide for Selenium-AT-SPI
- compile and run GCompris
- modify GCompris QML code to have access to its components (GUI elements)

A few modifications to Selenium-AT-SPI allowed the last problems to be solved (adding slider access and handling utf8 character problems) and Selenium-AT-SPI is now able to repeatidly test all the activities needed for the next Blue Angle eco-label test.

{{< video src="/blog/videos/kde-eco-test-gcompris-selenium-script.webm" controls=true autoplay=false loop=false >}}
{{< container class="text-center" >}} Video: Replication of KdeEcoTest script for GCompris. (Video from Nitin Tejuja published under a CC-BY-SA-4.0 license.) {{< /container >}}


To help you quickly use Selenium-AT-SPI for your own project, Nitin is working to update the KDE Eco Handbook with a full step-by-step Selenium-AT-SPI installation and usage guide, explaining how to add accessibility to QML and how to write the Selenium script in Python.

The handbook can be found [here](https://eco.kde.org/handbook/)

Once updated you will be able to find the guide under "Part IV: Selenium-AT-SPI"

His journey through the Sok 2023 can be found in the following three blog posts:


#### Achieving three KDE goals

Before finishing, I would like to explain the title of this entry and why we  "Achieved three KDE goals with one stone!"

Selenium-AT-SPI is used here to automate actions in order to measure power consumption and improve it, helping to reach one of our goal: Sustainable Software.

It can be used as unit testing to check if all the accessibility code we add is working, which will help us to reach another goal: KDE For All.

Finally, by being able to fully automate internal application testing, we can improve the quality of our applications and this contributes to our third goal: Automate And Systematize Internal Processes.

