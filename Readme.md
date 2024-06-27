<!-- vscode-markdown-toc -->
* 1. [Description](#Description)
* 2. [Requirements](#Requirements)
* 3. [How It Works](#HowItWorks)
* 4. [Potential Uses](#PotentialUses)
* 5. [Installation](#Installation)
	* 5.1. [Running the Script](#RunningtheScript)
	* 5.2. [Using the Compiled EXE / I don't want to install AutoHotkey, I just want to use the `F13`-`F24` keys!](#UsingtheCompiledEXEIdontwanttoinstallAutoHotkeyIjustwanttousetheF13-F24keys)
* 6. [Usage](#Usage)
* 7. [The Basic `F13`-`F24` Key Remapping / I don't want all this stuff! I just want to use the `F13`-`F24` keys in my script!](#TheBasicF13-F24KeyRemappingIdontwantallthisstuffIjustwanttousetheF13-F24keysinmyscript)
* 8. [License](#License)
* 9. [Contributing](#Contributing)
* 10. [Contact](#Contact)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

# Centomila's F13-F24 with CapsLock

##  1. <a name='Description'></a>Description
Centomila's F13-F24 with CapsLock is a simple but useful AutoHotkey v2 (AHK2) script that enhances the functionality of the `Caps Lock` key. When `Caps Lock` is **enabled**, the `F1`-`F12` keys are remapped to `F13`-`F24`. The status is displayed in the systray icon and for a short time on a tooltip in the bottom right corner.

While the remapping is really simple and can be done in less than 20 lines of code (see below), I wanted to create a script that covers many AutoHotkey functionalities that are often asked about on the official AutoHotkey Forum, Reddit, and Stackoverflow communities. I tried to comment the script as much as possible without being too verbose.

This script demonstrates examples of:
- Hotkeys with HotIf
- String concatenation
- Switch cases
- Caps Lock usage
- Customized systray menu
- Use of message boxes (_MsgBox_)
- Dynamic systray icon changes
- ToolTip text with absolute positioning in the bottom right corner
- Separate AHK files (_#include_)
- Installation of files from the compiled EXE (_FileInstall_)
- Use of AutoHotkey's _A_Temp_ variable to store icons and license files away from the user's eyes
- Use of AutoHotkey's _IsCompiled_ variable for compiling with AHK2EXE
- OS Language detection with the _A_Language_ variable

##  2. <a name='Requirements'></a>Requirements

- A Windows PC, 32-bit or 64-bit
- [AutoHotkey v2](https://www.autohotkey.com/v2/) (for running the script version)

##  3. <a name='HowItWorks'></a>How It Works

This application is created and compiled using AutoHotkey 2.0.17. It features a straightforward script that remaps the `F1` to `F12` keys to `F13` to `F24` when the Caps Lock key is pressed. Pressing the Caps Lock key again disables the remapping and restores the `F1` to `F12` keys.

Shift does not affect the remapping. For instance, if you press `Shift+F1` while Caps Lock is enabled, the system will interpret it as `Shift+F13`.

##  4. <a name='PotentialUses'></a>Potential Uses

This script is compatible with any application that supports the additional function keys (`F13`-`F24`), such as:

- DAWs (Digital Audio Workstations) like Bitwig Studio, Ableton Live, FL Studio, Cubase, etc.
- Graphic editors like Photoshop, GIMP, Krita, Inkscape, etc.
- CAD software like AutoCAD, SolidWorks, etc.
- Video editors like Adobe Premiere, DaVinci Resolve, etc.
- Broadcasting software like OBS, Streamlabs, etc.
- Code editors like Visual Studio Code, Atom, Sublime Text, etc.
- Other AutoHotkey scripts

##  5. <a name='Installation'></a>Installation

###  5.1. <a name='RunningtheScript'></a>Running the Script

1. Download and install [AutoHotkey v2](https://www.autohotkey.com/v2/).
2. Clone this repository.
3. Run the script by double-clicking the `.ahk` file.

###  5.2. <a name='UsingtheCompiledEXEIdontwanttoinstallAutoHotkeyIjustwanttousetheF13-F24keys'></a>Using the Compiled EXE / I don't want to install AutoHotkey, I just want to use the `F13`-`F24` keys!

For users who do not want to install AutoHotkey and just need a utility to use the `F13`-`F24` keys, the repository contains a compiled executable:

1. Download the compiled `.exe` file from the repository. Both 32-bit and 64-bit versions are available.
2. Run the executable by double-clicking the `.exe` file.

##  6. <a name='Usage'></a>Usage

1. Use the Caps Lock key to switch between `F1`-`F12` and `F13`-`F24` functionalities.
2. Right-click on the systray icon to open the menu for _Help_, view the _About_, or to _Exit_ the application.
    - The default action (double-click) opens a message box with a help message. The help message is available in 5 languages (English, German, Spanish, French, Italian) detected by the OS language.
    - The _About_ action opens a message box with some info about the author and the license in 5 languages (English, German, Spanish, French, Italian).
    - The _Exit_ action closes the application without asking for confirmation.
        - The compiled version also removes the content created in the user temp folder (`C:\Users\%USERNAME%\AppData\Local\Temp\F13F24` by default) during the script execution.

##  7. <a name='TheBasicF13-F24KeyRemappingIdontwantallthisstuffIjustwanttousetheF13-F24keysinmyscript'></a>The Basic `F13`-`F24` Key Remapping / I don't want all this stuff! I just want to use the `F13`-`F24` keys in my script!

If you just need a simple remapping of the `F1`-`F12` keys to implement in your script, this is all you need:

```AutoHotkey
#HotIf GetKeyState("CapsLock", "T")
    F1::F13
    F2::F14
    F3::F15
    F4::F16
    F5::F17
    F6::F18
    F7::F19
    F8::F20
    F9::F21
    F10::F22
    F11::F23
    F12::F24
#HotIf
```

##  8. <a name='License'></a>License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

##  9. <a name='Contributing'></a>Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

##  10. <a name='Contact'></a>Contact

If you have any questions or suggestions, feel free to open an issue on GitHub or contact me at [centomila.com](https://centomila.com/contact/).

---

Made with ❤️ by Centomila. If you found this application useful or inspiring, consider checking out my music and sharing it with others! You can find my discography at [centomila.com](https://centomila.com).