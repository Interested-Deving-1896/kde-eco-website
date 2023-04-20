---
date: 2023-04-20
title: "Final Weeks Of SoK23 With KDE Eco: Writing Scripts In Selenium To Reproduce KdeEcoTest Script"
categories: [SOK23, Selenium, KdeEcoTest, GCompris, AT-SPI]
author: Nitin Tejuja
summary: My experience writing scripts in Selenium for GCompris activities and reproducing the GCompris KdeEcoTest script.
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
  - SPDX-FileCopyrightText: 2023 Nitin Tejuja <@nitin.tejuja12:matrix.org>
---

Thank you once again to the KDE community for having me as part of this amazing Free & Open Source project through their annual program [Season of KDE](https://season.kde.org) (SoK). Please see [this](https://eco.kde.org/blog/2023-03-06-sok23-kde-eco/) and [this](https://eco.kde.org/blog/2023-04-05-sok23-kde-eco-selenium-project/) blog post for background information about the work described here.

#### Final Weeks Of SoK23

In these final weeks of SoK23 I have reproduced in Selenium the entire [`KdeEcoTestGcomprisScript.txt`](https://invent.kde.org/teams/eco/feep/-/blob/master/tools/KdeEcoTest/tests/KdeEcoGComprisTestScript.txt) script, which emulates user behavior in different [GCompris](https://apps.kde.org/gcompris/) activities.

{{< video src="/blog/videos/kde-eco-test-gcompris-selenium-script.webm" controls=true autoplay=false loop=false >}}

{{< container class="text-center" >}}
Video: Replication of KdeEcoTest script for GCompris. (Video from Nitin Tejuja published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)
{{< /container >}}

After first understanding the original script written with the emulation tool [KdeEcoTest](https://invent.kde.org/teams/eco/feep/-/tree/master/tools/KdeEcoTest) (see [this blog post](https://eco.kde.org/blog/2023-04-14-sok23-eco-tester/) also from an SoK23 mentee for recent updates to the tool), I began working on the activity called "Baby Word Processor". The [GCompris website](https://gcompris.net/screenshots-en.html) has screenshots and descriptions of this and other activities.

The "Baby Word Processor" activity includes a simple word processor which provides children the ability to easily write their first texts. The activity allows for saving, deleting, and loading text files.

I started by modifying the activity QML Code of "Baby Word Processor". I have added Accessible code to the Load and Save buttons in the activity. Below you can find the modified QML code in order to in order to be able to save text and reload them later on:

```
 GCButton {
    id: loadButton
    textSize: "regular"
    width: parent.width
    Accessible.name: "Load the file"
    text: qsTr("Load")
    onClicked: {
        keyboard.hide = true;
        creationHandler.loadWindow();
    }
    }
GCButton {
    id: saveButton
    textSize: "regular"
    Accessible.name: "Save the text to file`"
    width: parent.width
    text: qsTr("Save")
    onClicked: {
        keyboard.hide = true;
        var textToSave = {};
        // Remove focus to force text storing within the TextEdit
        edit.focus = false;
        textToSave["text"] = edit.getFormattedText(0, edit.length);
        creationHandler.saveWindow(textToSave);
    }
    }

```

Accessible code for this activity can be found [here](https://invent.kde.org/nitintejuja/gcompris/-/blob/selenium/src/activities/baby_wordprocessor/BabyWordprocessor.qml). With these modification to the QML Code, I wrote a Selenium script to test the activity, and code can be found [here](https://invent.kde.org/nitintejuja/feep/-/blob/selenium/tools/KdeEcoTestSelenium/scripts/kdeecotest-gcompris.py#L159).

Once the above script was running, I worked on the `KdeEcoTest` scenario that modifies the volume configuration of GCompris. The volume settings are changed by clicking the configuration icon once the app has loaded. To modify the settings, I added Accessible code to Configuration QML elements. Accessible code can be found [here](https://invent.kde.org/nitintejuja/gcompris/-/blob/selenium/src/activities/menu/ConfigurationItem.qml).

I then wrote the Selenium script to modify the volume settings. Here, I had to learn how to perform scrolling on an element using Selenium. The problem was that the volume settings are located one scroll down in the Configuration window. The following example therefore performs one scroll down on an element.

```
 self.driver.find_element(by=AppiumBy.NAME, value="element_name").send_keys(
            Keys.DOWN
)
```

In GCompris's configuration, the volume settings are changed using a slider. Since [selenium-webdriver-at-spi driver](https://invent.kde.org/sdk/selenium-webdriver-at-spi) is in development, changing a slider value had not yet been implemented. So I made a request to Harald Sitter and he quickly updated the selenium-webdriver. I have now updated the driver and it works :)

The Selenium script for changing volume settings can be found [here](https://invent.kde.org/nitintejuja/feep/-/blob/selenium/tools/KdeEcoTestSelenium/scripts/kdeecotest-gcompris.py#L97).

Finally, I was able to replicate all scenarios present in the GCompris KdeEcoTest emulation script using Selenium and I even added logs for actions taken in a format compatible with the data analysis tool [`OSCAR`](https://oscar.umwelt-campus.de/) (Open source Software Consumption Analysis and Reporting).

{{< container class="text-center" >}}

![Logs for actions taken in the Selenium script in a format compatible with `OSCAR`. (Image from Nitin Tejuja published under a [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) license.)](/blog/images/kde-eco-test-gcompris-test-log-file-sample.png)

{{< /container >}}

#### Community Bonding (SoK’23)

I want to thank everybody who made Season of KDE possible, especially my mentors.

I am very thankful to Harald Sitter for enhancing [`selenium-webdriver-at-spi`](https://invent.kde.org/sdk/selenium-webdriver-at-spi) whenever I encountered a problem that required a new functionality.

I am also thankful to you for taking the time to read this update. If you want to access the scripts, they can be found [here](https://invent.kde.org/nitintejuja/feep/-/tree/selenium/tools/KdeEcoTestSelenium/scripts).

Please feel free to contact me on Matrix at @nitin.tejuja12:matrix.org.
