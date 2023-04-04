---
date: 2023-04-05
title: "Season Of KDE 2023 With KDE Eco: Writing Scripts In Selenium To Reproduce KdeEcoTest Script"
categories:  [SOK23, Selenium, KdeEcoTest, GCompris, AT-SPI]
author: Nitin Tejuja
summary: My experience writing scripts in Selenium for GCompris activities and reproducing the GCompris KdeEcoTest script.
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
- SPDX-FileCopyrightText: 2023 Nitin Tejuja <@nitin.tejuja12:matrix.org>
---

I am very thankful to the KDE community for inviting me to be a part of this amazing Free & Open Source project through their annual program [Season of KDE](https://season.kde.org) (SoK). I am writing this blog as a follow-up to a [previous blog post](https://eco.kde.org/blog/2023-03-06-sok23-kde-eco/). Please check out that post for some background information about the work described here.

#### What I Have Done & Will Be Doing In The Coming Weeks

In the third week of SoK, I learned how to write scripts for [GCompris](https://apps.kde.org/gcompris/) activities in Python using Selenium-AT-SPI.

I wrote a script that performs the full testing of one activity present in GCompris. The activity is "Baby Keyboard". Its aim is to present and say aloud the letter on the key pressed by the user.

To be able to communicate with GCompris I had first to modify its `QML` code, adding the accessibility code needed. For example, in the "TextEdit" element below I have added "Accessible.name" as "textinput".

```
TextEdit {
            id: textinput
            Accessible.name: "textinput"
        }
```

In the Selenium script, we will now be able to use the above element with the name as locator and then the `send_keys` function to fil the textinput field.

```
textedit_element = driver.find_element(by=AppiumBy.NAME, value='textinput')
textedit_element.send_keys('textinput_value')
```

To perform the event handling on activity elements, I have added accessibility code to the "Baby Keyboard" activity `QML` elements, which can be found [here](https://invent.kde.org/nitintejuja/gcompris/-/blob/selenium/src/activities/baby_keyboard/Baby_keyboard.qml).

In the fourth week of SoK, I worked on understanding the [`KdeEcoTest`](https://invent.kde.org/teams/eco/feep/-/tree/master/tools/KdeEcoTest) script in order to reproduce its behaviour with Selenium. In the script for GCompris, the configuration of GCompris is modified and many activities are tested in order to simulate normal usage of the application in a Standard Usage Scenario.

In order to replicate the test script, I first worked with the "Baby Keyboard" activity. I added accessibility code to its `QML` elements, as above, and then I wrote the Selenium script to control the activity elements. While writing the script, I took note of the steps required to be able to communicate with the QT/QML application, summarized in the figure below.

{{< container class="text-center" >}}

![Steps to write a Selenium `Python` script for activity testing. (Image from Nitin Tejuja published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)](/blog/images/steps_to_write_script.png)

{{< /container >}}

The selenium script for the "Baby Keyboard" activity can be found [here](https://invent.kde.org/nitintejuja/feep/-/blob/selenium/tools/KdeEcoTestSelenium/scripts/baby_keyboard.py).

{{< container class="text-center" >}}

!["Baby Keyboard" activity testing using a Selenium `Python` script. (Image from Nitin Tejuja published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)](/blog/images/baby_keyboard_activity_testing.gif)

{{< /container >}}

Once the above script worked, I began working on the "Explore Farm Animals" activity in GCompris, and have added accessibility code to activate `QML` elements, which can be found [here](https://invent.kde.org/nitintejuja/gcompris/-/blob/selenium/src/activities/explore_farm_animals/ExploreLevels.qml).

Moreover, the "Explore Music World" activity Selenium script can be found [here](https://invent.kde.org/nitintejuja/feep/-/blob/selenium/tools/KdeEcoTestSelenium/scripts/explore_music_world.py).

{{< container class="text-center" >}}

!["Explore Music World" activity testing using a Selenium `Python` script. (Image from Nitin Tejuja published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)](/blog/images/explore_music_world_testing.gif)

{{< /container >}}

In the coming weeks, I will write scripts in Python to perform full testing for diffferent activities in GCompris. I will also log the events in the script.

#### Community Bonding (SoK’23)

I am thankful to my mentors Emmanuel Charruau and Harald Sitter for taking the time to help me by providing resources and solving my doubts. 

I am very thankful to Harald Sitter for enhancing [`selenium-webdriver-at-spi`](https://invent.kde.org/sdk/selenium-webdriver-at-spi) whenever I encountered a problem that required a new functionality.

I am also thankful to you for taking the time to read this update. If you would like to access the scripts, they can be found [here](https://invent.kde.org/nitintejuja/feep/-/tree/selenium/tools/KdeEcoTestSelenium/scripts).

Contact me on Matrix at @nitin.tejuja12:matrix.org.
