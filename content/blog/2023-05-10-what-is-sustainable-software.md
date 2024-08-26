---
date: 2023-05-10
title: What is Sustainable Software, After All?
categories:
  [Sustainability, Blauer Engel, Energy Efficiency, KDE Goals, User Autonomy]
author: Cornelius Schumacher
summary: '"Sustainable Software" is a strategic goal for KDE, focusing on minimizing resource consumption and strengthening user autonomy. The aim is to create software that uses fewer natural resources, reduces energy consumption, and promotes user choice and privacy.'
featured: true
thumbnail : /blog/thumbnails/what-sustainable-software-after-all.png
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
- SPDX-FileCopyrightText: 2023 Cornelius Schumacher <schumacher@kde.org>
---

## Understanding Sustainability in the Software Context

One of KDE's current strategic goals is the ["Sustainable Software" goal](https://community.kde.org/Goals/Sustainable_Software). There is a bunch of activities around that, but sometimes people still ask, "What does 'Sustainable Software' actually mean?" Let's try to break it down.

In general, sustainability means living and acting in a way that endures over time, without depleting resources or harming the environment and its inhabitants.

What does that mean in the context of software?

## Technical Aspects: Minimizing Resource Consumption

First of all, software indirectly consumes natural resources. It requires hardware to be built on which the software can run, and running software consumes energy. The way software is written has a significant influence on resource consumption.

An extreme example is [Bitcoin](https://digiconomist.net/bitcoin-energy-consumption), where the algorithm to secure the network requires an enormous use of computing resources and related energy consumption. Another example is software-induced hardware obsolescence, where hardware vendors drive sales of new hardware through software updates incompatible with older hardware, resulting in electronic waste and consumption of resources and energy in producing new hardware.

Most resources used in hardware production are not renewable, and energy is still primarily produced from depletable resources, such as fossil fuels, which additionally harm the environment by emitting greenhouse gases. Therefore, writing software in a way that minimizes hardware and energy consumption can be considered sustainable.

This aspect is mostly technical. It overlaps with performance optimization to make software more efficient, more responsive, or faster. It also overlaps with architecture and design of software, where high-quality solutions often also prove to be more sustainable.

## Non-Technical Aspects: User Autonomy

However, there is also a non-technical aspect to sustainable software. This concerns how it affects users and developers: does it force users to do things in certain ways, does it harm them by limiting what they can do, does it enable users to use it sustainably? This can be summarized as user autonomy, which is an essential aspect of sustainable software.

In the context of user autonomy, sustainable software should promote freedom of choice and encourage users to make informed decisions about their digital lives. This includes ensuring that software is accessible, compatible with various platforms and devices, and respects users' privacy and data ownership. By providing users with the tools and knowledge they need to use software sustainably, we can foster a more empowered and responsible user base, ultimately contributing to the broader goal of sustainability.

## KDE's Sustainable Software Goal

These are the aspects which we are considering under KDE's Sustainable Software Goal, improving resource and energy efficiency and strengthening user autonomy. We are looking at our software, but we also want to set examples to help others adopt these concepts, and we are part of a larger movement aiming for sustainability across our lives and society as a whole.

It can be a complex topic, and some questions are difficult to answer. There are trade-offs to be made. We do want to benefit from technical progress. We do want to improve quality of life. This comes with costs that may conflict with sustainability goals. Therefore, it is crucial to engage in open discussions and have values to guide decisions. The KDE community has both. Our [vision](https://community.kde.org/KDE/Vision) and [manifesto](https://manifesto.kde.org/) provide a strong base that aligns well with the idea of sustainable software. It is a natural fit, and it is gratifying to see how we, as the KDE community, can contribute to a greater goal.

## Concrete Activities and Future Outlook

We have several concrete activities to advance our goal of sustainable software. One area is the measurement of resource and energy efficiency. We have built a [lab to do energy measurements](https://eco.kde.org/blog/2022-05-30-sprint-lab-setup/). The starting point was to be able to conduct measurements for the [Blue Angel eco-certification](https://eco.kde.org/blog/2022-03-16-press-release-okular-blue-angel/). Now, we are expanding its capabilities to enable more flexible remote access. There also is work going into [automating usage scenarios](https://invent.kde.org/teams/eco/feep/-/tree/master/tools/KdeEcoTest) that form the basis for these measurements. And we are [collecting](https://invent.kde.org/teams/eco/sustainable-software-goal/-/blob/master/awesome-sustainable-software.md) and [providing](https://eco.kde.org/handbook/) resources related to the topic.

If you would like to be part of this community and make your contribution to sustainability, don't hesitate to join us at [eco.kde.org](https://eco.kde.org).
