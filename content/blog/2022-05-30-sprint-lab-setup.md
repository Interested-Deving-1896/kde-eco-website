---
publishDate: 2022-05-30
date: 2022-05-30
title: "Energy Consumption Lab Is Ready For FOSS Community! Dispatch From The Sprint"
categories: [Sprint, KDE Eco, Blauer Engel, Community Lab]
author: Joseph P. De Veaugh-Geiss
summary: On Saturday 21 May 2022 KDE Eco held the first of several in-person Sprints for the community lab to measure the energy consumption of Free Software.
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
- SPDX-FileCopyrightText: 2022 Joseph P. De Veaugh-Geiss <joseph@kde.org>
---

On Saturday 21 May 2022 KDE Eco held the first of several in-person Sprints for the community lab to measure the energy consumption of Free Software. The Sprint had been postponed twice due to Corona, but the third time was a charm.

KDAB Berlin was gracious in hosting us. They offered us not only a space to construct the lab, but also donated hardware and a brand-new power meter (!), and they even invited everybody to a delicious lunch. In total there were 11 of us at the Sprint, with two participants travelling across Germany to be there. KDE and [KDAB Berlin](https://www.kdab.com/) were well-represented (Björn, Volker, Nico, Cornelius, Tobias, Joseph), but the event had broad appeal: several [Qt company](https://www.qt.io/) employees (André, Fabian, Sami) as well as the [Green Coding Berlin](https://www.green-coding.org/) project (Arne) and a [Hasso-Plattner-Institut/Universität Potsdam](https://osm.hpi.de/) researcher (Sven) joined us.

The community is at the heart of the work of KDE Eco, and without all of you none of this would be possible!

{{< container class="text-center" >}}

![](/blog/images/sprint-participants.webp)

*Smiling community members after a productive day. ([Image: CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/))*

{{< /container >}}

The primary goal for the day was to set up two donated [Dell Optiplex 390](<https://www.dell.com/en-us/work/shop/desktops-all-in-one-pcs/optiplex-390-desktop/spd/optiplex-390>) desktop computers and the [GUDE Expert Power Control 1202](<https://www.gude.info/en/power-distribution/switched-metered-pdu/expert-power-control-1202-series.html>) power meter for measuring how much energy Free Software consumes. When you get a bunch of coders together, however, so much more can happen -- and it did here too! Throughout the day several participants also worked with the high-resolution [Microchip MCP39F511N](<https://www.microchip.com/en-us/product/MCP39F511N>) device and the low-resolution [Gosund SP111](<https://web.archive.org/web/20201022205319/https://templates.blakadder.com/gosund_SP111_v2.html>) power plug (see [configuration instructions to be merged at the FEEP repository](https://invent.kde.org/teams/eco/feep/-/merge_requests/6) and this blog post for [automatically reading the energy data from the power plug](https://web.archive.org/web/2021*/https://volkerkrause.eu/2020/10/17/kde-cheap-power-measurement-tools.html)). Volker has also just published a [blog post providing details about the surpising results](https://volkerkrause.eu/2022/05/28/kde-eco-sprint-may-2022.html) of their work.

{{< container class="text-center" >}}

![](/blog/images/hacking-power-meters.webp)

*Working with GUDE Expert Power Control 1202 (left power strip), Gosund SP111 (plugged in at top of right power strip), and Microchip MCP39F511N (directly next to right power strip) devices. Although we need more light in the photograph, the lamp (left) was there for calibration purposes only. ([Image: CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/))*

{{< /container >}}

{{< container class="text-center" >}}

![](/blog/images/power-meters.webp)

*Closer up: GUDE Expert Power Control 1202 (top power strip next to laptop/lamp base), Gosund SP111 (plugged in next to on/off switch of bottom power strip), and the Microchip MCP39F511N development board (just below bottom power strip). ([Image: CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/))*

{{< /container >}}

The lab set up followed the approach described in the research paper [Sustainable software products -- Towards assessment criteria for resource and energy efficiency](https://www.umwelt-campus.de/fileadmin/Umwelt-Campus/Greensoft/1-s2.0-S0167739X17314188-main.pdf). For the systems to test software on, referred to as the Systems Under Test (SUT), we installed [KDE Neon User Edition](https://neon.kde.org/download) and [Kubuntu 22.04](https://cdimage.ubuntu.com/kubuntu/releases/22.04/release/). In order to best use the available hardware, we decided that the power meter data will not have a dedicated third computer to collect data, referred to in the above article as the Data Aggregator and Evaluator. Instead, data will have to be collected on the investigators' own computers. We see no reason to expect this will be problematic, and it allows us to compare power consumption from two different reference systems running KDE Plasma Desktop.

{{< container class="text-center" >}}

![](/blog/images/gude-pm.jpg)

*This is the GUDE Expert Power Control 1202. (Screenshot taken from product website.)*

{{< /container >}}

Note that for the reference systems on the SUTs, we will run up-to-date operating systems representing real-world computing environments, as opposed to unchanging and thus [maximally replicable](https://invent.kde.org/teams/eco/feep/-/issues/3) ones. We think this decision will be more helpful for achieving the KDE Eco community's main objectives: measuring and then driving down the energy consumption of software.

One long-term vision for the lab is to [automate the measurement process](https://invent.kde.org/teams/eco/be4foss/-/issues/12) with remote access for FOSS developers so they can measure their software easily and from anywhere in the world. Although we did not work on automation at the Sprint -- would you, the reader, like to help with this in the near future? -- Nico did set up the SUTs for remote access using SSH and VNC. The set up is based on previous work he did for his Master's thesis at [Universität Würzburg](www.uni-wuerzburg.de).

It is perhaps a given that another goal is to use exclusively Free Software in the lab. Thus, for reading out the measurement data from the Gude power meter, we decided to use a [Python script](https://gitlab.rlp.net/green-software-engineering/mobiles-messgerat) published by researchers at the Umwelt Campus Birkenfeld under the GPLv3 license. This script uses the [Simple Network Management Protocol](https://en.wikipedia.org/wiki/Simple_Network_Management_Protocol) (SNMP) to read data from the device. Getting it to work, though, was not trivial, but Cornelius, with input from Sami and Fabian, did a great job of getting it running. Cornelius [documented the necessary steps](https://invent.kde.org/teams/eco/feep/-/blob/master/measurement_setup.md) at the Free and open source Energy Efficiency Project (FEEP) repository.

{{< container class="text-center" >}}

![](/blog/images/working.webp)

*View of the community lab, where participants were working together to configure the Python script to read data from the Gude power meter and to set up the Systems Under Test for remote access with SSH and VNC. ([Image: CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/))*

{{< /container >}}

Although we did not measure any software at the Sprint, we did test the [Standard Usage Scenario script for Kate](https://invent.kde.org/teams/eco/be4foss/-/tree/master/standard-usage-scenarios/kate) from Season of KDE 2022 student Karanjot Singh. That said, we should have data for Kate and other KDE/Free Software such as GCompris very soon from the coming [measure-athon](https://invent.kde.org/teams/eco/be4foss/-/issues/28)! If you are a FOSS developer and want to measure your software, please [be in touch](https://eco.kde.org/get-involved/).

The in-person Sprint was a great opportunity not only to set up the measurement lab but also to get to know the community better... and we truly are a wonderful community! Moreover, much more was achieved at the event than can easily be summed up here. Throughout the day there were many vibrant conversations about how we can effectively reduce the environmental impact of digitization. Although it was not possible to answer such a big question at this event, as a community we took small but important steps forward in making Free Software the most sustainable software.

{{< container class="text-center" >}}

![](/blog/images/vibrant-conversation.webp)

*There were many vibrant conversations throughout the day. ([Image: CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/))*

{{< /container >}}

The community is at the heart of the work of KDE and KDE Eco, and without you none of this would be possible -- again, a big thank you to everyone who joined us! Moreover, what we do is possible because of the support of KDE e.V. as well as [BMUV](www.bmuv.de)/[UBA](https://www.umweltbundesamt.de/en), who financially support the BE4FOSS project.

Did you know? Discussions similar to those at the Sprint occur monthly at our community meetups on the 2nd Wednesday of the month from 19h-20h (CET/CEST). [Join us](https://eco.kde.org/get-involved/), we would love to see you there!

#### Funding Notice

The BE4FOSS project was funded by the Federal Environment Agency and the Federal Ministry for the Environment, Nature Conservation, Nuclear Safety and Consumer Protection (BMUV<sup><a id="fnr.1" class="footref" href="#fn.1">1</a></sup>). The funds are made available by resolution of the German Bundestag.

{{< container >}}

<img src="/blog/images/bmuv.png" alt="BMUV logo" width="340px"/>

<img src="/blog/images/uba.jpg" alt="UBA logo" width="250px"/>

{{< /container >}}

The publisher is responsible for the content of this publication.

<sup><a id="fn.1" href="#fnr.1">1</a></sup> Official BMUV and UBA-Logos are sent only by request at: verbaendefoerderung@uba.de
