---
date: 2023-06-13
title: "KEcoLab: Remote Energy Measurement Lab"
categories: [Sustainability, Blauer Engel, Energy Efficiency, Sustainable Software Goal, GSoC'23]
author: Karanjot Singh
summary: 'In this post I start my journey in Google Summer of Code (GSoC) with KDE Eco by describing progress made on the exciting project of making remote access to the Energy Measurement Lab a reality.'
featured: true
thumbnail : /blog/thumbnails/kecolab-blog-post-image-dark.png
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
- SPDX-FileCopyrightText: 2023 Karanjot Singh <drquark@duck.com>
---

Hello everyone! I am excited to announce my participation in [Google Summer of Code (GSoC)](https://community.kde.org/GSoC) with [KDE Eco](https://eco.kde.org/). I will be sharing my journey and progress through a series of blog posts as I work on the exciting project of making remote access a reality for the Energy Measurement Lab at KDAB, Berlin.

## About Me
I am Karanjot Singh, a sophomore at Jaypee Institute of Information Technology, India. 
I have had the opportunity to work as an LFX Mentee at the Cloud Native Computing Foundation (KubeScape) and also as a mentor at Season of KDE 2023. With a keen interest in Free and Open Source projects, I have been actively contributing to the community for several years.
My journey with KDE started in 2022 when I was a mentee in KDE’s annual program, Season of KDE. During that program, I collaborated with the KDE Eco project to [create Standard Usage Scenarios](https://eco.kde.org/blog/2022-03-03-sok22-kde-eco/) for measuring software's energy consumption while collecting hardware performance information, such as CPU usage and network traffic. Since then, I have been an active member of this amazing community, and I thoroughly enjoy contributing to it.

## Project Overview
[Sustainability is a key goal for KDE over the next two years](https://community.kde.org/Goals). As part of this goal, KDE aims to measure the energy consumption of its software and eco-certify applications with the Blue Angel ecolabel.
Currently, we measure the energy consumption of our software in a lab in Berlin following the process documented in the KDE Eco Handbook [`Handbook: Applying The Blue Angel Criteria To Free Software`](https://eco.kde.org/handbook/).

The lab setup requires (i) a test PC (*System Under Test*) to run user-emulation scripts, (ii) a power meter to measure the energy consumption of the test PC, and (iii) another PC (*Data Aggregator & Evaluator*) to collect and analyze the output data. In the current setup, developers must rely on individuals in Berlin to test software for them on-site in the lab.

{{< container class="text-center" >}}

![Overview of laboratory setup: System Under Test (SUT), Power Meter (PM), and Data Aggregator and Evaluator (DAE). Image from KDE published under a CC-BY-SA-4.0 license. Design by Lana Lutz.](https://eco.kde.org/handbook/images/sec3_lab-setup_modified.png)

{{< /container >}}
The GSoC project aims to provide remote access to the lab in two steps: first, by automating the energy measurement process, including providing a summary of the results; and second, by setting up backend CI/CD integration as well as a frontend upload portal.
By automating the process and providing remote access, we make it possible for developers to measure the energy consumption of their software from any location in the world. The increased access to the lab will enable data-driven decision-making for efficiency improvements in code and software eco-certification with environmental labels like the Blue Angel.

The core idea behind the project is to implement a solution where developers can provide three scripts (baseline, idle mode, and standard usage scenario) along with a config file, and then automatically obtain a summary of results from [`OSCAR`](https://oscar.umwelt-campus.de/) (Open source Software Consumption Analysis in R).

{{< container class="text-center" >}}


<img src="/blog/images/gsoc1-remote-measurement-lab-overview.png" alt="CI Process" width="1000px"/>


{{< /container >}}
### Remote Access 1:
The first step is to implement a CI/CD pipeline as a backend solution for performing energy consumption measurements in the remote energy measurement lab. The CI/CD pipeline will be divided into three stages. The first stage will involve installing the Flatpak on the lab computer, followed by the energy measurement stage where energy consumption will be measured using a predefined process. Finally, in the last stage, the results will be available as an artifact.

{{< container class="text-center" >}}

<img src="/blog/images/gsoc1-cicd.png" alt="CI Process" width="750px"/>

{{< /container >}}
### Remote Access 2:
The second step is to design a frontend interface for authorization and inputting user data in the remote lab. This frontend will provide developers with a user-friendly platform to test their software and contribute to energy measurement efforts.

To delve deeper into the technical details and project plan, you can refer to my detailed proposal: [`GSoC'23-Karanjot Singh ( KDE ECO PROPOSAL )`](https://invent.kde.org/teams/eco/feep/-/blob/master/tools/KEcolab/GSoC'23-Karanjot%20Singh%20(%20KDE%20ECO%20PROPOSAL%20).odt).

## Community Bonding
I am thankful to [Joseph P. De Veaugh-Geiss](https://invent.kde.org/joseph), [Volker Krause](https://invent.kde.org/vkrause), [Benson Muite](https://invent.kde.org/kbkmde), and [Nicolas Fella](https://phabricator.kde.org/p/nicolasfella/) who have been extremely supportive and helpful.
Special thanks to Volker and Joseph for their multiple visits to the lab to assist me in setting up the project infrastructure.

During the community bonding period, I have had the opportunity to connect with the larger KDE Eco community at [KDE's Energy Efficiency](https://matrix.to/#/#energy-efficiency:kde.org) Matrix channel as well as during the monthly KDE Eco community meet-ups. You, the reader, are also welcome to join the conversation: the online meetups are on the second Wednesday of each month from 19:00-20:00 CEST/CET (UTC +2:00/+1:00). Additionally, the GSoC mentors and I have established regular internal meet-ups on Thursdays to ensure consistent communication and progress updates. This enables the core team to stay connected, address any queries, and track the project's development. In order to foster open collaboration and maintain a public record of discussions, I have also created a public matrix channel ([Measurement Lab Development](https://matrix.to/#/#kde-eco-dev:kde.org)) for the project, where community members can contribute and share their views. All who you are interested in getting involved are welcome, whether it's by providing input on the remote access lab setup or by measuring your software's energy consumption once everything is set up.

## Week 1
During the first week of GSoC, I focused on setting up the necessary infrastructure in the lab to enable remote access. This involved configuring SSH access, setting up the X Server to run applications remotely, and enabling auto-login. 

Additionally, I started building the CI/CD pipeline for the flatpack installation process, which will be a vital component of enabling remote energy consumption measurements.
{{< container class="text-center" >}}

![Gude Power Meter being accessed remotely](/blog/images/gsoc1-gude.png)

{{< /container >}}
We encountered a couple of challenges during the initial setup when running applications remotely in the lab without enabling X-Forwarding (To ensure precise energy measurements, we avoid using X-Forwarding in this scenario as it could potentially interfere with the accuracy of the measurements.). However, with the assistance of my mentors, we were able to resolve them. Furthermore, with help of my mentors, we successfully set up a [Raspberry Pi](https://www.raspberrypi.org/), which will allow us to remotely control the power meter and lab PC.

## Next Steps
In the upcoming weeks, I will continue working on implementing the CI/CD pipeline. Additionally, I will explore ways to streamline the energy measurement process, ensuring the accuracy and reliability of remotely obtained results.

I am grateful for the opportunity to contribute to KDE Eco as part of summer of code and work on this impactful project of enabling remote access to the Energy Measurement Lab. By removing geographical barriers, we can empower developers worldwide to make informed decisions regarding energy consumption and software optimization. 

I am excited about the progress we have made so far and look forward to sharing more updates in the upcoming blog posts.
Stay tuned as I navigate through this exciting GSoC journey with KDE Eco!