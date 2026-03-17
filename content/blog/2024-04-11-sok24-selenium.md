---
date: 2024-04-11
title: "How Selenium Helps Build Sustainable Software (And More)"
categories:  [SoK, Selenium, Sustainability, KDE Goals, KDE Eco]
author: Pradyot Ranjan
summary: Enhancing and promoting Selenium to achieve KDE's goals.
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
- SPDX-FileCopyrightText: 2024 Pradyot Ranjan <@pradyotranjan:gitter.im>
---

{{< container class="text-center" >}}

![Logo of the KDE Eco initiative. (Image from KDE published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license. Design by Lana Lutz.)](/blog/images/KDE-eco-logo-name_vegetation.jpg)

{{< /container >}}

#### What Is Sustainability And Why This Project?

In a general sense, sustainability [refers to](https://www.investopedia.com/terms/s/sustainability.asp) "the ability to maintain or support a process continuously over time". But what does it mean in terms of software? 

With a rise in new technologies over the past half a century, the energy consumption of digital technology has greatly increased as well. Take, for example, large LLM models and cryptocurrency technology: both of these have heavy energy requirements. Software directly or indirectly consumes natural resources. The way software is written has a significant influence on resource consumption, such as with software-induced hardware obsolescence, when hardware vendors drive sales of new hardware through software updates that are incompatible with older hardware. The result is electronic waste and the unnecessary consumption of resources and energy in producing and transporting new hardware.

Sustainability in software means minimizing this waste. How? By designing software to limit energy consumption and have a smaller environmental impact. For this, we need tools to measure how much energy our software — and the hardware which runs it — needs. Without measurements, we cannot compare and we cannot improve!

KDE Eco has been working on KEcoLab, a project from Karanjot Singh to make KDE's measurement laboratory accessible to contributors from all over the world. KEcoLab needed a tool to easily playback usage scenarios for energy consumption data, and this is exactly what Selenium does by running automatic functional testing! But that's not all. Selenium also helps achieve the ["KDE For All"](https://community.kde.org/Goals/KDE_For_All) goal by enabling accessibility improvements for everyone. It helps achieve the ["Automate & Systematize Internal Processes"](https://community.kde.org/Goals/Automate_and_systematize_internal_processes) goal by creating functional tests to ensure the high quality of new code. In this way, Selenium helps achieve [all three of KDE's goals](https://eco.kde.org/blog/2023-05-04-sok23-kde-eco-selenium-sum-up/)!


#### Writing Tests In Selenium

Selenium AT-SPI is a Selenium-based tool used in KDE for automated tests of GUI applications. It works by identifying accessibility elements for a particular action.

Writing a Selenium test is comprised of the following steps:
- Identifying QML elements where the action needs to be performed.
- Add accessibility code to QML elements. Accessibility code is basically a locator which will help Selenium identify that element and interact with it.
- Get elements by its locator. Once we are done with the previous step, we can now access those elements. 
- Perform events on the elements. Once we are able to access elements, we can write code to interact with them. 


You can follow [this guide](https://community.kde.org/Selenium) to setup Selenium AT-SPI and start writing basic tests. You can also check out [this blog post](https://develop.kde.org/docs/apps/tests/appium/) for an in-depth overview.

{{< container class="text-center" >}}

![Video "Selenium AT-SPI: How Selenium Helps Achieve KDE's Goals" (screenshot from Pradyot Ranjan published under a [CC-BY-4.0](https://spdx.org/licenses/CC-BY-4.0.html) license).](/blog/images/plasma-6-wallpaper-image.jpeg)

{{< /container >}}

#### Introducing Selenium To More KDE Contributors

This project was done under SoK'24 with these deliverables in mind:
- Improve the setup process of Selenium.
- Create video guides to introduce Selenium-based GUI testing to more KDE contributors. 

I am achieving this by:

- Enhancing the Selenium setup guide. You can find the updated *Setup* and *Getting Started* guides [here](https://community.kde.org/Selenium). It includes all of the latest packages and info about distro-specific packages and dependencies required to setup Selenium. I've also updated the *Writing Tests* section to account for deprecated function arguments.
- Creating slides and videos. I have created video presentations for newcomers to Selenium so that it is a smooth transition. For this I'm using KDE's [Kdenlive](https://kdenlive.org/en/) software for video editing. Once the videos are published online, I will update this blog post with links. The videos broadly cover these topics:
 1. An intro video about what Selenium is and how it is useful in achieving KDE's goals.

 2. Setting up Selenium.
 3. Using the [`accerciser`](https://help.gnome.org/users/accerciser/stable/introduction.html.en) utility to discover accessibility elements.
 4. Writing accessibility code and tests to show how to access elements.

{{< container class="text-center" >}}

![Using Kdenlive to edit the Selenium videos (screenshot from Pradyot Ranjan published under a [CC-BY-4.0](https://spdx.org/licenses/CC-BY-4.0.html) license).](/blog/images/using_kdenlive.jpeg)

{{< /container >}}

#### Challenges Faced And Looking Forward

Some challenges that I faced were:
- Updating the setup guide so it is relevant with the latest changes. Selenium-AT-SPI is a moving target with a lot of internal changes and developements. Tracking down distro specific packages and making a list of deprecated/missing dependencies was time-consuming. The latest version of the setup guide can be found [here](https://community.kde.org/Selenium).
- Making videos for using Selenium. With no prior experience, this was a challenge for me. I am proud to have done it!

As we move ahead, we have some plans for this project. Some of them are:

- We will be creating support rooms in Matrix to provide further support for KDE developers.
- We will use Selenium to adapt usage scenario scripts originally written with `xdotool` so we can compare the energy profiles of the emulation tools themselves.

#### Interested In Contributing?

If you are interested in contributing to Selenium-AT-SPI, you can join the Matrix channels [KDE Energy Efficiency](https://matrix.to/#/#energy-efficiency:kde.org) and [Automation & Systematization Goal](https://matrix.to/#/#kde-institutional-memory:kde.org) and introduce yourself. Selenium-AT-SPI is hosted [here](https://invent.kde.org/sdk/selenium-webdriver-at-spi). Thank you to Emmanuel, Rishi, Nitin, and Joseph as well as the whole KDE e.V. and the wonderful KDE community for supporting this project and for all the help along the way. You can also reach out to me via [email](rickprimeranjan@gmail.com) or on Matrix: @pradyotranjan:gitter.im.