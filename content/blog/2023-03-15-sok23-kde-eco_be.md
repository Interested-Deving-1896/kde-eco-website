---
date: 2023-03-15
title: "Adapting Standard Usage Scenario Scripts For KDE Applications: My Journey As A Season Of KDE Mentee"
categories: [SOK23, Blauer Engel, KdeEcoTest, GCompris, Kate]
author: Rudraksh Karpe
summary: I am working on the Blue Angel Certification Preparation project, specifically adapting the usage scenario scripts for Kate and GCompris. Here I share my experience and progress in the project.
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
- SPDX-FileCopyrightText: 2023 Rudraksh Karpe <@rudrakshkarpe:matrix.org>
---

### My Journey into the KDE Community: From Season of KDE Application to Mentee

The notification about the Season of KDE program arrived like a ray of sunshine on a dreary day, and I eagerly clicked on it to see what opportunities it held. Amidst the many exciting project ideas, the Blue Angel Certification Preparation for KDE applications stood out to me as a challenge worth pursuing. I took the first step towards realizing my goal by engaging in a conversation with the community and making some initial contributions to FEEP. On January 24th, the selected candidates were announced. My heart was pounding as I scanned the list of names, and when I saw mine, I let out a cheer! Being accepted as a mentee in the KDE community was a great start to the year 2023. ✨ 

For the project, I will be using emulation tools such as `xdotool` and `KDE Eco Tester` to finish preparation of usage scenario scripts needed to measure KDE applications such as [Kate](https://apps.kde.org/kate/) and [GCompris](https://apps.kde.org/gcompris/). To help guide my work, my mentor and I created a to-do list based on my proposed timeline and we selected the KDE infrastructure to manage the checklist of tasks. This was my first exposure to the diverse range of applications and platforms provided by KDE for the community. 🤌

### Continuing Work on Standard Usage Scenarios

My first task was writing a brief summary of how the emulation tools work and explaining their usage. [This summary](https://invent.kde.org/teams/eco/feep/-/blob/master/tools/overview_actiona_xdotool_kde-eco-tester.md) was later added to the tools documentation in the FEEP repository. 📝

To prepare an application for Blue Angel eco-certification, I am continuing work on [Karanjot Singh's Standard Usage Scenario (SUS)](https://eco.kde.org/blog/2022-03-03-sok22-kde-eco/) for Kate. For this work I am utilizing `xdotool` to execute the scenario, which runs a series of tasks considered typical when using this software. It is worth noting that the scripts to be executed should have a minimum duration of 5 minutes to meet the Blue Angel requirements. 

When testing the existing script and obtaining the logs, I proposed that the manual efforts to determine the elapsed time could be automated. For this purpose I developed the `KDE-SUS Log Formatter`, which is [currently under review](https://invent.kde.org/teams/eco/feep/-/merge_requests/30) at the FEEP repository. This was not originally included in the to-do list, but my mentor and I recognized the tool's significance in simplifying the documentation process and I proceeded to develop it. 💻

{{< container class="text-center" >}}

![Running the Kate usage scenario. (Image from Rudraksh Karpe published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)](/blog/images/2023-03-15_kate-SUS.gif)

{{< /container >}}

🎉 We then set our sights on the [`KDE Eco Tester`](https://invent.kde.org/teams/eco/feep/-/tree/master/tools/KdeEcoTest) tool and the SUS for Gcompris, a versatile educational software suite for children. To accomplish this, I first learned more about the tool, which is developed by KDE Eco contributors Emmanuel Charruau, Karanjot Singh, and now Mohamed Ibrahim, the mentee for the KDE Eco Tester project in SoK23. The tool provides an easy and robust emulation tool based on `xdotool`. With `KDE Eco Tester` I am adapting the existing SUS for GCompris in order to make the script at least five minutes long while representing typical usage of the app. I plan to update Kate's usage scenario to also be scripted using `KDE Eco Tester`. In the process, I will provide feedback on the tool's usability and user experience to the developers.

Although the work is still ongoing, I have encountered some challenges along the way. I am facing challenges such as resizing the GCompris window to 830x830, and when running the old SUS script dealing with UI changes from a GCompris update. We also discovered that the response time for some actions can be slow, which causes problems when running the script. Thanks to the help of Emmanuel and Mohamed, we were able to identify and address these challenges, and the project is continuing to move forward. A special thank you goes out to Mohamed for his valuable contributions and support as I work on GCompris! Below is a GIF demonstrating the tasks being tested using `KDE Eco Tester` for GCompris.

{{< container class="text-center" >}}

![Running the GCompris usage scenario. (Image from Rudraksh Karpe published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)](/blog/images/2023-03-15_gcompris-SUS.gif)

{{< /container >}}

Working with KDE has been a pleasure. Everyone has been kind, knowledgeable, and supportive throughout the process, making my journey a smooth and enjoyable one. I am determined to overcome the challenges and provide a detailed account of my experience in upcoming blog posts. ☀️

Stay tuned!
