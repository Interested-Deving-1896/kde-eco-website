---
date: 2024-02-20
title: "Making way for Wayland in KdeEcoTest"
categories: [SoK, KdeEcoTest, Wayland]
author: Athul Raj K
summary: Improving KdeEcoTest and making it compatible on Wayland systems
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
- SPDX-FileCopyrightText: 2024 Athul Raj K <@krathul:matrix.org>
---

## KdeEcoTest

KdeEcoTest is an automation and testing tool which allows one to record and simulate user interactions with a Graphical User Interface. It is being developed as part of the [FOSS Energy Efficiency Project](https://invent.kde.org/teams/eco/feep) to create usage scenario scripts for measuring the energy consumption of software in the [KDE Eco](https://eco.kde.org/) initiative. Emmanuel Charruau is the original developer and lead maintainer of the project. In Season of KDE 2023 the tool was further improved by [Mohamed Ibrahim](https://eco.kde.org/blog/2023-04-14-sok23-eco-tester/) under the tutelage of Karanjot Singh and Emmanuel Charruau.

One of the main goals in Season of KDE 2024 is to make the KdeEcoTest cross-platform so it can run on Windows and Linux systems (both Wayland and X11). Another necessary change in KdeEcoTest is to completely remove the use of `libX11` and `xdotool` from the code base, which had issues with pixel coordinates while testing.

A benefit of a tool such as `KdeEcoTest` is that it is possible to create usage scenario scripts without having access to the source code of the software being tested. This is in contrast to a tool such as [Selenium-AT-SPI](https://planet.kde.org/harald-sitter-2022-12-14-selenium-at-spi-gui-testing/), which requires access to the application's sources (QML file).

See how Selenium-AT-SPI helps with the KDE Eco project [(Selenium-AT-SPI KDE Eco)](https://eco.kde.org/blog/2023-05-04-sok23-kde-eco-selenium-sum-up/).

## Getting Started: Platform Abstraction Layer

For the tool to be cross platform, it requires a platform abstraction layer, which is what Amartya Chakraborty and I, the SoK24 team, set out to write first. Any action, either simulated or read by the KdeEcoTest tool, can be separated into Window-based and Input device-based. The design goal is therefore to provide platform-independent interfaces for performing these actions.

We finished work on the abstraction layer and integrated it into the current code base with some minor changes. The layer provides two interfaces, a WindowHandler and an InputHandler (which have a platform-specific implementation), in order to access the underlying methods for taking window or input actions. 

The team's next task was to implement these platform-specific classes. For the SoK24 project, Windows-specific classes were tasked to Amartya Chakraborty, while I set out to implement support for Wayland.

## Adding Wayland Support: KDE's `kdotool`
From initial conversations between me, Emmanuel, and other members of the KdeEcoTest channel, we decided on using [`ydotool`](https://github.com/ReimuNotMoe/ydotool), a program written in C that simulates input devices with [`uinput`](https://docs.kernel.org/input/uinput.html). This enables the simulation of input devices on Wayland as well.

But `ydotool` was not enough as it did not support manipulating windows like `xdotool` did and we still required listening to input devices. For Window-based actions it requires communication with the underlying display server or `compositor` (in Wayland world), and Wayland currently did not have such a protocol. So we went back to the drawing board and tried different methods, even running the application as an X Client on [`Xwayland`](https://wayland.freedesktop.org/xserver.html), which indeed worked but could hardly be called a solution to supporting Wayland. 

{{< container class="text-center" >}}

![Running as X client on Wayland using Xwayland. (Image from Wayland docs published under an [MIT](https://spdx.org/licenses/MIT.html) license.)](/blog/images/2024-02-20-x-on-wayland.png)

{{< /container >}}

We thought that currently there did not exist any solution for Wayland, but we were wrong. It turns out that `KWin`, the KDE Plasma compositor for Wayland and X11, already had one! One fine day Emmanuel posted a message on the KDE Dev channel, and voilà we got our solution from a KDE developer in the form of a Rust tool, [`kdotool`](https://github.com/jinliu/kdotool). The tool uses KWin’s dbus interface to upload a JavaScript file and access methods and properties provided by the [KWin scripting API](https://develop.kde.org/docs/plasma/kwin/api/). Just love you, KDE!

Emmanuel brought kdotool’s author ‘genericity’ on board and we set sail. With some minor tweaks and upgrades we integrated kdotool into KdeEcoTest and we now have all window-related functionalities set up and working on X11 and Wayland. (Oh … and by the way that’s when I found out you can’t have `gitsubmodules` on invent.kde.org). The use of the KWin specific APIs means that KdeEcoTest will currently only work on KDE Plasma.

Special mention to ‘genericity’ for developing this great tool.

## Adding Input Actions

With all window-related actions in, it was time to add support for input actions. I was testing this out with ydotool, but later dropped it and decided to directly access `uinput`. Reading through Linux kernel documentation, I found it's rather better to use the [`evdev`](https://docs.kernel.org/input/input.html) interface, which also allows one to create and simulate devices and also to read inputs from existing ones.

> evdev is the generic input event interface. It passes the events generated in the kernel straight to the program, with timestamps. The event codes are the same on all architectures and are hardware independent. The layout of the input event -

```c
struct input_event {
        struct timeval time;
        unsigned short type;
        unsigned short code;
        unsigned int value;
};
```
> `time` is the timestamp, it returns the time at which the event happened. `Type` is for example EV_REL for relative movement, EV_KEY for a keypress or release. `code` is event code, for example REL_X or KEY_BACKSPACE. `value` is the value the event carries. Either a relative change for EV_REL, absolute new value for EV_ABS (joysticks ...), or 0 for EV_KEY for release, 1 for keypress and 2 for autorepeat.
> 
You can find more details about the input event codes here, https://docs.kernel.org/input/event-codes.html.

`libevdev` sits below the process that handles input events, in between the kernel and that process. The stack would look like this:

 - Kernel → libevdev → libinput → Wayland compositor → Wayland client

And for X11 using `libinput`:

 - Kernel → libevdev → libinput → xf86-input-libinput → X server → X client

With the `python-evdev` binding for libevdev one could directly access evdev devices, but there is a catch: the script needs to be run as root, or the user needs permissions to read and write from `/dev/input` and `/dev/uinput` (and also /dev/console to run `dumpkeys` to get the keyboard drivers translation table). Considering the challenges, this was something we could live with.

My first plan was to directly use `evdev` to simulate and listen to input devices, but digging into it some more I found out that [`pynput`](https://github.com/moses-palmer/pynput) had a uinput backend that, it turns out, was not fully implemented (it was partially implemented for keyboard). `pynput` is a cross-platform Python library that allows one to control and monitor input devices. Since pynput was already being used in KdeEcoTest and it supported all other systems (except Wayland), implementing a backend that uses `libevdev` would allow for using pynput and its already implemented methods and classes directly.

I finished writing a backend for pynput which allowed me to simulate and listen for mouse and keyboard events on Wayland. But there is one more problem with directly using libevdev. Input events generated from libevdev are passed to [`libinput`](https://wayland.freedesktop.org/libinput/doc/latest/) before reaching the compositor. 

{{< container class="text-center" >}}

![libinput (Image from Wayland docs published under an [MIT](https://spdx.org/licenses/MIT.html) license.)](/blog/images/2024-02-20-libinput.png)

{{< /container >}}

`libinput` processes these inputs and provides easy-to-use APIs to handle them. It also provides configurable interfaces, which means that inputs we simulate using uinput may not be interpreted the same way by the compositor. For, e.g. the delta values in `EV_REL` type events (Event type for relative movement) generated by evdev devices such as a mouse are converted into relative movement on screen using a function called [pointer accelaration](https://wayland.freedesktop.org/libinput/doc/latest/pointer-acceleration.html) in libinput. This function depends on the pointer acceleration profiles configured by the user depending on the compositor. There are namely two: "adaptive and flat". We skip further low level details about this here, and just add that switching to "flat" profile provides 1:1 movement between the device and the pointer on-screen. This also means that the mouse acceleration profile needs to be set to flat when running KdeEcoTest.

Now all that was required was to alias InputHandler class's attributes to pynput classes. This may be improved in the future when individual level implementation is required.

With both now implemented and integrated, KdeEcoTest supports running on Wayland, and also with the contribution from Amartya Chakraborty it runs on Windows as well.

## Finished Platform Abstraction layer

The platform abstraction layer in current form sets the required backend for pynput, imports the necessary backend and exposes the required interfaces `WindowHandler` and `InputHandler`. When running on KDE Plasma, since we require kdotool, it additionally adds kdotool to the path.

```python
import platform as _platform
import os
from pathlib import Path
import importlib

def set_handlers(package):
    module = None
    if _platform.system() == 'Windows':
            module = '.win32'
            os.environ['PYNPUT_BACKEND']='win32'
    elif _platform.system() == 'Linux':
        if os.environ.get('XDG_SESSION_DESKTOP',None) == 'KDE':
            module = '.kwin'
            os.environ['PYNPUT_BACKEND']='uinput'
            #add kdotool to path
            KDOTOOL_PATH = os.path.join(Path(os.path.dirname(__file__)).parent,'bin/kdotool/release')
            os.environ['PATH'] = KDOTOOL_PATH + ':' + os.environ['PATH']
        elif os.environ.get('XDG_SESSION_TYPE',None) == 'X11':
            print('Platform Not Supported')
            exit()

    try:
        return importlib.import_module(module,package)
    except ImportError:
         raise ImportError('Platform not supported')

backend = set_handlers(__name__)

WindowHandler = backend.WindowActionHandler
InputHandler = backend.InputActionHandler

del backend

__all__ = [
     WindowHandler,
     InputHandler
]
```

## Looking Forward

The listener for mouse events in pynput's uinput backend currently does not listen for touchpad events, because the event codes generated made it confusing to implement one. I think a better approach would be to use `libinput` for listening for events, as this would provide abstraction and also make it easier to write code for handling events, but libinput currently lacks a python binding. 

## Interested?

Of course it is far from complete. KdeEcoTest is still very much a work in progress and we're happy to have more developers looking to contribute.
Hop on to the [KdeEco](https://go.kde.org/matrix/#/#energy-efficiency:kde.org) and [KdeEcoTest](https://go.kde.org/matrix/#/#kdeecotest:kde.org) matrix channels to join the developers and follow the tool's development.

See https://invent.kde.org/teams/eco/feep for the FEEP repository, which hosts the KdeEcoTest tool among others.


Thank you to Emmanuel, 'genericity', Amartya, Joseph, as well as the whole KDE community and Wayland developers for helping out with the project.






