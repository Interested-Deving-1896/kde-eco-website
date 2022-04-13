---
publishDate: 2022-04-13
date: 2022-04-13
title: "GCompris 2.4 Release: Improved Data Efficiency Conserves Network Bandwidth, Saves Energy"
categories: [GCompris, Data Efficiency, Bandwidth Conservation]
author: Johnny Jazeix
summary: A simple change both improved image quality and greatly reduced the size of the app!
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
- SPDX-FileCopyrightText: 2022 Johnny Jazeix <jazeix@gmail.com>
---

GCompris is KDE's educational software suite and currently includes around 170 activities for children aged from 2 to 10 years old. All these activities have big, bright and colorful images, designed to encourage children to have fun with the tasks.

Two months ago Karl, a GCompris contributor, [asked](https://mail.kde.org/pipermail/gcompris-devel/2022-February/006101.html) if the images on our *Erase* activity could be updated to use higher-quality images.

{{< container class="text-center" >}}

![](/blog/images/gcompris360.png)

*GCompris releases version 2.4 -- with a focus on data efficiency! ([Image Source](https://invent.kde.org/websites/gcompris-net/-/blob/master/news/images/gcompris360.png))*

{{< /container >}}

From the maintainer's perspective, this was a difficult decision. Yes, we understand the value of good-quality images; however, due to constraints on Android, we cannot have packages above 100MB. And we were already close to the limit: the previous version for arm64 devices was already 91MB!

{{< container class="text-center" >}}

![](/blog/images/gcompris-r2_4_erase.png)

*Erase: Screenshot of better quality images with a smaller size ([Image Source](https://invent.kde.org/websites/gcompris-net/-/raw/master/news/images/r2.4.png))*

{{< /container >}}

In GCompris, much of the application space is used up by the images, and, until now, we have been using the most common formats, such as PNG and JPEG. So we decided to run some tests, and we found that, in the *Paintings* activity (which contains the biggest number of graphical assets) we could convert the PNG images to WebP without any loss in quality. The size, however, went from 9.1MB to 6.6MB! What's more, it could be reduced even further down to 1.9MB if we used a quality of 90 converting with the [ImageMagick](https://imagemagick.org/) tool!

Karl also did some tests on the JPEG images to see whether we could achieve acceptable quality, and then Timothée did the tremendous work of converting almost all of the files from PNG and JPEG to WebP.

Although a few images were kept in the original format (as there was no gain in converting them), we documented the conversion steps [on our website](https://gcompris.net/wiki/Artwork_guidelines#Adding_external_images) and the following data shows the difference between versions 2.3 and 2.4, with the most significant change being the use of [better quality, yet more data-efficient images](https://gcompris.net/index-en.html#2022-04-13):
    
* [Source code](https://download.kde.org/stable/gcompris/qt/src/): 75MB -> 48MB
* [Linux (32 bit)](https://download.kde.org/stable/gcompris/qt/linux/): 100MB -> 73MB
* [Linux (64 bit)](https://download.kde.org/stable/gcompris/qt/linux/): 105MB -> 78MB
* [Windows](https://download.kde.org/stable/gcompris/qt/windows/): 103MB -> 69MB (here the reduction is not only due to the image conversion, but because we also removed a bunch of unused DLLs that were taking up space)
* [Android (32 bit)](https://download.kde.org/stable/gcompris/qt/android/): 88MB -> 62 MB
* [Android (64 bit)](https://download.kde.org/stable/gcompris/qt/android/): 91 MB -> 64 MB
* [macOS](https://download.kde.org/stable/gcompris/qt/macos/): 100MB -> 71MB

For the external image dataset used in vocabulary activities, we went from [66MB to 41MB](https://cdn.kde.org/gcompris/data2/words/).

So overall we reduced the size of GCompris by between 25% to 30% (~27MB)!

{{< container class="text-center" >}}

![](/blog/images/gcompris-r2_4_clickgame.png)

*Clickgame: Screenshot of better quality images with a smaller size ([Image Source](https://invent.kde.org/websites/gcompris-net/-/raw/master/news/images/r2.4.png))*

{{< /container >}}

Apart from the reduction in size, the images load faster, even if this is not perceptible to the user. For the *Paintings* activity, which contains 269 images, a simple benchmark shows it takes ~157ms to load all WebP images (as QImage), whereas it took ~185ms when we were using PNG images.

This data efficiency means that we will be able to add more content without worrying about the size limitation. Even better, the reduction in package size means downloading it uses less bandwidth, and thus demands less energy from the network. A [2017 report](https://theshiftproject.org/wp-content/uploads/2019/03/Lean-ICT-Report_The-Shift-Project_2019.pdf) from the French non-profit "The Shift Project" found that 16% of digital energy consumption is from network use. The changes in the 2.4 release may not make a dent in those worldwide numbers taken individually, but increased data efficiency can make a difference in the long run and when replicated over many applications.

GCompris is also used in many countries with poor Internet connections. Making digital tools -- especially educational ones -- more accessible by requiring less network bandwidth has benefits for us all!

{{< container class="text-center" >}}

![](/blog/images/distribution-energy-consumption.png)

*Screenshot from "Lean ICT: Towards Digital Sobriety (Report Of The Working Group Directed By Hugues Ferreboeuf For The Think Tank The Shift Project –- March 2019)" ([Source](https://theshiftproject.org/wp-content/uploads/2019/03/Lean-ICT-Report_The-Shift-Project_2019.pdf))*

{{< /container >}}

GCompris is one of the many FOSS apps that will be measured at [KDE Eco's measure-athon](https://invent.kde.org/teams/eco/be4foss/-/issues/28) in our coming community lab at KDAB Berlin.

GCompris is [available for download](https://www.gcompris.net/downloads-en.html) on multiple platforms such as Linux, Android, Windows, macOS, Raspberry Pi, and Ubuntu Touch.