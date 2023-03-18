---
date: 2023-03-18
title: "Season of KDE 2023 With KDE Eco: Writing Scripts in Selenium to Reproduce KdeEcoTest Script"
categories:  [SOK23, Selenium, KdeEcoTest, GCompris, AT-SPI]
author: Nitin Tejuja
summary: My experience about writing scripts in selenium for GCompris Activities and reproducing the GCompris KdeEcoTest script in selenium.
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
- SPDX-FileCopyrightText: 2023 Nitin Tejuja <@nitin.tejuja12:matrix.org>
---

I am very thankful to the KDE community for inviting me to be a part of this amazing Open Source project through their annual program [Season of KDE](https://season.kde.org). I'm writing this blog with continuation from [blog post](https://eco.kde.org/blog/2023-03-06-sok23-kde-eco/)

#### What I Have Done & Will Be Doing In The Coming Weeks

For the third week of the project, I learnt to write scripts for GCompris application activities in python using selenium-at-spi. I wrote a script that performs the full testing of one activity present in GCompris application.

The activity is baby_keyboard and its aim is to show and tell the name of a letter present on a key pressed by its user.

To be able to communicate with GCompris I had first to modify its `QML` code, adding the accessibility code needed.

Example:
In this below TextEdit element, I have added accessible name as textinput.

```
TextEdit {
            id: textinput
            Accessible.name: "textinput"
        }
```

In Selenium script, we will be able to use above element using its name as locator and then `send_keys` function to fil the textinput field.
```
textedit_element = driver.find_element(by=AppiumBy.NAME, value='textinput')
textedit_element.send_keys('textinput_value')
```

To perform the event handling on activity elements, I have added accessibility code to Baby Keyboard activity `QML` elements and can be found [here](https://invent.kde.org/nitintejuja/gcompris/-/blob/selenium/src/activities/baby_keyboard/Baby_keyboard.qml).

During my 4th week, I worked to understand `KdeEcoTest` script in order to reproduce its behaviour with Selenium. In GCompris `KdeEcoTest` script, we do the testing of GCompris applications configurations and test many activities in order to simulate a normal usage.

In order to replicate the test, I first worked with the activity called Baby Keyboard. I have added Accessibility code to its `QML` Elements, then I wrote the Selenium script to control the activity elements.

While writing the script, I took note of the steps required to be able to communicate with QT/QML application and I summarize them in below figure.

{{< container class="text-center" >}}

![Steps to write Selenium `Python` script for activity testing. (Image from Nitin Tejuja published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)](/blog/images/steps_to_write_script.png)

{{< /container >}}

Baby Keyboard activity selenium script can be found [here](https://invent.kde.org/nitintejuja/feep/-/blob/selenium/tools/KdeEcoTestSelenium/scripts/baby_keyboard.py)

{{< container class="text-center" >}}

![Doing Baby Keyboard activity testing using Selenium `Python` script. (Image from Nitin Tejuja published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)](/blog/images/baby_keyboard_activity_testing.gif)

{{< /container >}}

Once the above script worked, I worked on the Music World activity, and have added accessibility code to activity `QML` elements.

Accessibility code for music world activity can be found [here](https://invent.kde.org/nitintejuja/gcompris/-/blob/selenium/src/activities/explore_farm_animals/ExploreLevels.qml)

{{< container class="text-center" >}}

![Doing Explore World music testing using Selenium `Python` script. (Image from Nitin Tejuja published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)](/blog/images/explore_music_world_testing.gif)

{{< /container >}}

Explore music world activity selenium script can be found [here](https://invent.kde.org/nitintejuja/feep/-/blob/selenium/tools/KdeEcoTestSelenium/scripts/explore_music_world.py)


In the coming weeks, I will write scripts in Python to perform full testing for diffferent activities in GCompris. I will also logs for the events on element in script. 

#### Community Bonding (SoK’23)

I'm thankful to my mentors Emmanuel Charruau and Harald Sitter for taking the time to help me by providing resources and solving my doubts. 

I'm very thankful to Harald Sitter for enhancing the selenium-webdriver-at-spi.

I am also thankful to you for taking the time to read this update. If you would like to access the scripts, they can be found [here](https://invent.kde.org/nitintejuja/feep/-/tree/selenium/tools/KdeEcoTestSelenium/scripts).

Contact me on Matrix at @nitin.tejuja12:matrix.org.
