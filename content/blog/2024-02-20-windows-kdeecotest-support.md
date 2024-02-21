---
date: 2024-02-21
title: "Introducing Support For KdeEcoTest On Windows"
categories:  [SoK, KdeEcoTest, Windows]
author: Amartya Chakraborty
summary: Extending KdeEcoTest support for Windows platform
SPDX-License-Identifier: CC-BY-SA-4.0
authors:
- SPDX-FileCopyrightText: 2024 Amartya Chakraborty <@camartya:matrix.org>
---

KdeEcoTest is an emulation tool aimed at emulating user activity when measuring the energy consumption of an application. You can read more about work on KdeEcoTest at [this SoK23](https://eco.kde.org/blog/2023-04-14-sok23-eco-tester/) and [this SoK24](https://eco.kde.org/blog/2024-02-20-sok24-wayland_support_kdeecotest/) blog post. Check out the [KDE Eco handbook](https://eco.kde.org/handbook/#a-how-to-measure-your-software) for more details about measuring software's energy consumption.


{{< container class="text-center" >}}

![KDE Eco logo.](/blog/images/KDE-eco-logo-name_vegetation.jpg)

{{< /container >}}


One of the main goals of the KDE Eco project for Season of KDE 2024 is to extend KdeEcoTest so it can run on both Windows and GNU/Linux (X11 \& Wayland). This enables energy consumption measurements of a single application across different platforms, such as Okular in X11 vs. Wayland vs. Windows.

This also makes it possible to compare Okular with a proprietary application like Adobe Acrobat. Comparisons with proprietary software are possible because KdeEcoTest can create usage scenario scripts without requiring access to the source code of the software being tested!

I have taken the task of extending support for Windows.


## Getting Started: Platform Abstraction Layer

The primary function of KdeEcoTest is to emulate user behavior. Why do we need an abstraction layer for this?

   1. Think about simulating keyboard shortcuts. We'll need to change many parts of the code. But if we have an abstraction layer, we can add new features easily. Just add a function to the right module.
   2. Currently, we have 3 modules for 3 different platforms, namely, Wayland, X11, and Windows. If a fourth platform needs to be added, one can simply extend the base handler class and implement the abstract functions.
   3. This abstraction layer ensures that the same script can be used for testing across several different platforms. 


During the first two weeks of SoK'24, Athul Raj K and I worked on understanding the code base and creating the abstraction layer. The layer provides two interfaces to access the underlying methods for taking window or input actions, a WindowHandler and an InputHandler (which have platform specific implementations). 

{{< container class="text-center" >}}

![Running a Standard Usage Scenario script on the Windows Platform for [GCompris](https://gcompris.net) prepared with KdeEcoTest.](/blog/images/2024-02-21_windows_kdeecotest.png)

{{< /container >}}

## Initial Task: `pywin32` For Windows Management

[`pywin32`](https://pypi.org/project/pywin32/) is a python module that provides access to many of the Windows APIs. This is used to perform window management actions for the Windows platform. Special thanks to Emmanuel for pointing out this wonderful module which has made it very convenient to extend KdeEcoTest support to Windows.

Win32 is an application programming interface (API) developed by Microsoft. It is dedicated to 32-bit Windows operating systems. Using this API, developers benefit from a set of functions for creating Windows applications using programming languages such as C, C++, and Visual Basic. They are able to control and manipulate various aspects of the Windows operating system. `ctypes` is a Python library for calling functions from shared libraries (DLLs) with a syntax similar to C. Pywin32 uses ctypes to use win32 functions.

During the first week, I explored the module to find the required functions and tested them out on a Windows machine. In the third week of Sok'24, I integrated the functions in the KdeEcoTest codebase. Now, the same test scripts that were used to test on X11 also run on Windows! The WindowActionHandler of win32 module under core/Handlers/win32.py handles the window management functions for Windows platforms.

```python
class  WindowActionHandler(BaseWindowActionHandler):
	@classmethod
	def  GetHandler(cls):
		return  cls()
	
	@staticmethod
	def  GetActiveWindow():
		# returns the handle of the currently active window
		win_id  =  win32gui.GetForegroundWindow()
		return  win_id
	
	@staticmethod
	def  GetwindowLocation(win_id):
		# returns active window loaction -> {"x": start_x, "y":start_y}
		start_x, start_y, end_x, end_y  =  win32gui.GetWindowRect(win_id)
		location  =  namedtuple("location", ["x", "y"])
		return  location(start_x, start_y)  

	@staticmethod
	def  GetWindowGeometry(win_id):
		# returns active window geometry -> {"width": width, "height": height}
		start_x, start_y, end_x, end_y  =  win32gui.GetWindowRect(win_id)
		width  =  end_x  -  start_x
		height  =  end_y  -  start_y
		geometry  =  namedtuple("geometry", ["width", "height"])
		# return {"width": width, "height": height}
		return  geometry(width, height)  

	@staticmethod
	def  SelectWindow():
		# returns the window handle of the window selected by user
		x, y  =  win32gui.GetCursorPos()
		win_id  =  win32gui.WindowFromPoint((x, y))
		return  win_id  
	
	@staticmethod
	def  WindowMove(win_id,win_posx:int, win_posy:int):
		# relocates active window to specified loaction
		current_size  =  WindowActionHandler.GetWindowGeometry(win_id)
		win32gui.SetWindowPos(win_id, win32con.HWND_TOP, win_posx, win_posy, current_size.width, current_size.height, win32con.SWP_SHOWWINDOW)  
	
	@staticmethod
	def  ResizeWindow(win_id,n_height:int,n_width:int):
		# resizes active window to specified dimensions
		current_position  =  WindowActionHandler.GetwindowLocation(win_id)
		win32gui.SetWindowPos(win_id, win32con.HWND_TOP, current_position.x, current_position.y, n_width, n_height, win32con.SWP_SHOWWINDOW)  

	@staticmethod
	def  WindowFocus(win_id):
		# brings the window to top(focus)
		win32gui.SetActiveWindow(win_id)
		win32gui.SetForegroundWindow(win_id)
```

## A Minor Setback: Adding Support For Input Actions

`pywin32` also provides support for simulating mouse actions such as left clicks as well  as keyboard key presses. However, I am not yet able to create a proper listener for input actions of the user. The module does not provide a default listener, although it does provide a function `win32api.GetAsyncKeyState()` which can be used as a listener inside an infinite loop. Running an infinite while-loop results in unnecessary resource utilization of processor and main memory, which slows down the tool and affects the results of the test cases.

For these reasons, [`pynput`](https://pynput.readthedocs.io/en/latest/index.html) has been chosen instead, which works across all the targeted platforms.

The class InputActionHandler bundles all the pynput handlers required for emulating the user input activities

```python
class  InputActionHandler(BaseInputActionHandler):
	@classmethod
	def  GetHandler(cls):
		return  cls()

	def  __init__(self) -> None:
		super().__init__()
		self.mouse  =  mouse.Controller()
		self.mouse_listener  =  mouse.Listener
		self.mouse_buttons  =  mouse.Button

		self.keyboard  =  keyboard.Controller()
		self.keyboard_listener  =  keyboard.Listener
		self.keyboard_keys  =  keyboard.Key
```





## Looking Forward

Currently, I am working on testing the accuracy of mouse pointers using the 9 point calibration testing. This can also be used to check window size inaccuracy caused by window decorations such as the title bar on Windows.

I also plan to replace `pynput` with `pywin32` if I can find or develop a proper listener for user actions.

I would like to thank the project mentors Emmanuel Charrau and Joseph P. De Veaugh-Geiss for their amazing support and guidance. Also, I am thankful to Athul Raj K, my fellow contributor in SoK'24, for his support and collaboration during this Season of KDE.







