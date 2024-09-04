---
date: 2024-09-05
title: "Goals Sprint Recap"
categories: [KDE Eco, Sustainable Software]
author: Cornelius Schumacher
summary: 'Recap of what we did at the goals sprint and where we are today.'
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
- SPDX-FileCopyrightText: 2024 Cornelius Schumacher <schumacher@kde.org>
---

In April we had the combined [goals sprint](https://community.kde.org/Sprints/Goals/2024), where a fine group of KDE people working on things around [Automation & Systematization](https://community.kde.org/Goals/Automate_and_systematize_internal_processes), [Sustainable Software](https://community.kde.org/Goals/Sustainable_Software), and [Accessibility](https://community.kde.org/Goals/KDE_For_All) got together. It was a nice cross-over of the KDE goals, taking advantage of having people in one room for a weekend to directly discuss topics of the goals and what is between them. [David](https://blog.david-redondo.de/kde/2024/04/26/goals-sprint.html), [Albert](https://tsdgeos.blogspot.com/2024/05/kde-goals-april-2024-sprint.html), [Nate](https://pointieststick.com/2024/04/24/berlin-mega-sprint-recap/), [Nico](https://nicolasfella.de/posts/goal-sprint-2024/), and [Volker](https://www.volkerkrause.eu/2024/04/27/kde-goal-sprint-april-2024.html) wrote about their impressions from the sprint.

So what happened regarding the Sustainable Software goal at the sprint and where are we today with these topics? There are some more detailed [notes](https://community.kde.org/Sprints/Goals/2024/Eco_Notes) of the sprint. Here is a summary of some key topics with an update of current progress.

## Kick-Off for the Opt-Green project

The [Opt-Green project](https://invent.kde.org/teams/eco/opt-green/-/tree/master) is the second funded project of the KDE Eco team. The first one was the [Blue Angel for Free Software](https://invent.kde.org/teams/eco/be4foss) project, where we worked on creating material helping free software projects to assess and meet the criteria for the Blue Angel certification for resource and energy-efficient software products.

The Opt-Green project is about promotion of reusing older hardware to run current free software to reduce electronic waste. It's funded for two years by the German Federal Environment Agency and the Federal Ministry for the Environment, Nature Conservation, Nuclear Safety and Consumer Protection and running from April 2024 to March 2026.

![Opt-Green presentation](/blog/images/opt-green-presentation.png)

Joseph [introduced the project](https://invent.kde.org/teams/eco/opt-green/-/blob/master/conferences/talks/2024-04-20_goals-sprint.pdf), why it's important, how the environment is suffering from software induced hardware obsolescence, and how free software in general and KDE specifically can help with fighting it. The approach of the project is to go beyond our typical audience and introduce people who are environmentally aware but not necessary very technical to the idea of running sustainable free software on their old computers. In many cases this is a perfectly fine solution, and it's surprisingly attractive to a number of people who care about sustainability but haven't really been introduced to free software yet.

### Where we are today

The project is in full swing. The project has already been present on quite a number of events to motivate people to install free software on their old devices and support them in how to do it. See for example the report about the [Academy of Games](https://engineering.upvest.co/posts/sponsoring-future-engineers/).

## Revamping the KDE Eco website

We had a great session putting together ideas and concepts of how we could improve the KDE Eco website. From brainstorming ideas to sketching a wireframe in the group, we discussed and agreed on a direction of how to present what we are doing in the KDE Eco team.

![KDE Eco website sketches](/blog/images/kde-eco-website-sketches.png)

The key idea is to focus on three main audiences (end users, advocates, and developers) and present specific material targeted at these groups. This nicely matches what we already have, e.g. the handbook for how to fullfil the Blue Angel criteria for developers, or the material being produced for events reaching out to end users, and gives it a much more focused presentation.

### Where we are today

The first iteration of the new design is live now on [eco.kde.org](https://eco.kde.org/). There is more to come, but it already gives an impression where this is going. Anita created a wonderful [set of design elements](https://invent.kde.org/teams/eco/opt-green/-/blob/master/organizational/brand/opt-green-branding-proposal.pdf) which will help to shape the visual identity of KDE Eco going forward.

## Surveying end users about their attitude to reuse hardware

Making use of old hardware by installing sustainable free software on it is a wide field. There are many different variations of devices and what users do with them als varies a lot. What are the factors that might encourage users to reuse old hardware, what is holding them back?

To get a bit more reliable answers to these questions we came up with a concept for a user survey which can be used at events where we present the Opt-Green project. This includes questions about what hardware people have and what is holding them back with installing new software on them.

### Where we are today

The concept has been [implemented](https://invent.kde.org/teams/eco/opt-green/-/issues/5) with an online survey on KDE's survey service. It's available in English and German and is being used at the events where the Opt-Green project is present.

![Opt-Green Survey](/blog/images/Printout_QRCode_Survey.jpg)

## Sustainable AI

One of the big hype topics of the last two years has been Generative AI and the Large Language Models which are behind this technology. They promise to bring revolutionary new features, much closer to how humans interact in natural language, but they also come with new challenges and concerns.

One of the big questions is how this new technology affects our digital freedoms. How does it relate to free software? How does licensing and openness work? How does it fit KDE's values? Where does it make sense to use its technology? What are the ethical implications? What are the implications in terms of sustainability?

We had a [discussion](https://community.kde.org/Sprints/Goals/2024/Eco_Notes#Sustainable_AI) around the possible idea of adopting something like Netcloud's [Ethical AI rating](https://nextcloud.com/blog/nextcloud-ethical-ai-rating/) in KDE as well. This would make it more transparent to users how use of AI features affects their freedoms and give them a choice to use what they consider to be fine.

### Where we are today

This still is pretty much an open question. The field is moving fast, there are legal questions around copyright and other aspects still to be answered. Local models are becoming more and more an option. But what openness means in AI has become very blurry. KDE still has to find a position here.
