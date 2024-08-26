---
date: 2024-08-26
title: "What's New In The Revised Blue Angel Criteria"
categories: [KDE Eco, Sustainable Software, Blue Angel]
author: Cornelius Schumacher
summary: 'The criteria for the Blue Angel for resource- and energy-efficient software have been updated. What has changed and what does that mean for KDE?'
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
- SPDX-FileCopyrightText: 2024 Cornelius Schumacher <schumacher@kde.org>
---

KDE's Okular is the [first software](https://eco.kde.org/blog/2022-03-16-press-release-okular-blue-angel/) which got awarded with the [Blue Angel label for resource and energy-efficient software products](https://www.blauer-engel.de/en/certification/basic-award-criteria#UZ215-2020). The certification was based on the first version of the criteria for this product criteria which were introduced in 2020. Now the criteria have been updated. What has changed and what does that mean for KDE?

The revised criteria are available as [version 4](https://produktinfo.blauer-engel.de/uploads/criteriafile/de/DE-UZ%20215-202001-de%20Kriterien-V4.pdf) on the [Blue Angel web site](https://www.blauer-engel.de/en). Only the German version is currently available; the English version will follow shortly.

## New software categories

The biggest change is the scope of the label. In the past it was limited to desktop software. With the updated version, the criteria also include **software on mobile devices** and **server software** or a combination of these categories, such as a web service with mobile and desktop clients.

The biggest challenge is the measurement of the energy and resource efficiency for these new categories, which requires a more flexible approach and must accommodate scenarios where the measurement cannot be done by inserting a meter in front of the power supply of a single device. The new criteria address this by defining applicable methods for the measurement of mobile and server applications.

The extended scope covers a much broader range of software. For KDE the desktop category is most relevant, but of course a lot of software also interacts with a server component, for example an email client like KMail, which could now be treated and assessed as a combined client-server system to give more realistic and relevant results.

## More flexible measurement procedure

The expansion in scope requires an expanded view on the measurement of energy and resource efficiency as well. The first version of the criteria was quite strict and prescribed a very specific measurement procedure on specified reference systems. It was based on a comparison of measurements in a representative usage scenario and in idle mode. This gave a realistic impression of what the usage of a computer program meant in terms of energy consumption.

The new criteria allow for more variation in how the measurements are carried out. The original method is still there, but variations which lead to comparable results are possible as well. This change means that a new criterion was introduced to **document the way measurements are done**.

In addition to the measurement of the usage scenario, a new type of measurement was introduced. This measures **total energy consumption of a production system over a longer period of time**. This is particular useful for server applications, where this method can lead to more realistic numbers by averaging resource consumption over real-world usage of multiple users.

For mobile applications, the measurement also has to include the data volume transmitted during a standard usage scenario and the list of URLs it has accessed. This is based on the assumption that large volumes of data transfer imply a higher energy usage. It can also be used to assess if the application is using advertisements or is collecting tracking information. Both are forbidden under the revised Blue Angel criteria.

## Ongoing assessment of energy and resource efficiency

The original criteria demanded that updates of the software still run on old reference systems and that the energy consumption does not increase more than 10%. They were not very clear in how exactly this should be proven and documented. Especially for software which is released very often, testing every individual update is impractical. For mobile and even more for server software, update cycles can be very short, up to multiple updates a day.

In the updated criteria there is a more precise way of handling updates. The general idea is still there that updated software run on old hardware and energy consumption not increase too much. But it's not tied to individual updates anymore. The required procedure is to do a measurement at least once a year and publish the results as part of the documentation of the software product. This includes documentation of the measurement setups and any changes to it as well as preserving the history of measurements, so that users can judge for themselves how much energy and resource usage is increasing over time.

This procedure clarifies the requirments and opens a pragmatic way of measuring updates. It implies a certain burden on updating documentation.

## Consequences for KDE and Okular

KDE holds the Blue Angel label for its PDF viewer Okular. This is desktop software and the standard usage scenario doesn't include any network access. That means that the expanded scope does not change anything for the existing certification. The revised criteria open up the opportunity to apply for the Blue Angel label for mobile software, such as KDE Connect, and mixed scenarios which also include server components, but the eco-certification for Okular is covered as it was before.

The more flexible measurement criteria give us more leeway in how we are doing the measurements. We have set up [KEcoLab](https://invent.kde.org/teams/eco/remote-eco-lab) for being able to regularly do measurements. This setup follows the procedure prescribed in the original criteria. As this is still valid, it also means no change for us, and our measurements still fulfill the criteria. However, it gives us more opportunities to improve the lab and doesn't strictly tie us to the original list of reference systems anymore. We might want to take advantage of that.

The documentation of the measurement system is something we have always done in a transparent way, so this also doesn't require any big changes on our side. We have to consider how to best convey this in the documentation of Okular, but this is mostly a question on how we communicate the existing content.

The ongoing assessment of energy and resource efficiency ties very well into how we handle software updates. We have a continuous release stream with frequent updates and incremental changes. This fits the model of the new criteria. We have to review how we include regular updates of the documentation and measurement data in releases, but this again is mostly a question of how we communicate the existing content.

## Conclusion

The revised criteria provide a welcome expansion of the Blue Angel to more categories of software and a more flexible way to do energy and resource efficiency measurements. They continue to align well with how KDE develops software in general and Okular in particular, so we do not see any issues with continuing the Blue Angel certification for Okular.

We would be happy if the new version of the criteria would increase adoption of the Blue Angel ecolabel for resource and energy efficient software. Sustainable software is an important topic and the Blue Angel can be one way of making progress in this area more visible to a broad audience.
