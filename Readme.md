# F13-F24 with CapsLock

## Description

**F13-F24 with CapsLock** is a simple but useful AutoHotkey v2 (AHK2) script that enhances the functionality of the `Caps Lock` key. When `Caps Lock` is **enabled**, the `F1`-`F12` keys are remapped to `F13`-`F24`. The status is displayed in the systray icon and for a short time on a tooltip in the bottom right corner.

While the remapping is really simple and can be done in less than 20 lines of code (see below), I wanted to create a script that covers many AutoHotkey functionalities that are often asked about on the official AutoHotkey Forum, Reddit, and Stackoverflow communities. I tried to comment the script as much as possible without being too verbose.

This script demonstrates examples of:

- Hotkeys with HotIf
- String concatenation
- Switch cases
- Caps Lock usage
- Customized systray menu
- Use of message boxes (_MsgBox_)
- GUI Window with buttons
- Dynamic systray icon changes
- ToolTip text with absolute positioning in the bottom right corner
- Separate AHK files (_#include_)
- Installation of files from the compiled EXE (_FileInstall_)
- Use of AutoHotkey's _A_Temp_ variable to store icons and license files away from the user's eyes
- Use of AutoHotkey's _IsCompiled_ variable for compiling with AHK2EXE
- OS Language detection with the _A_Language_ variable

## 2. Requirements

- A Windows PC, 32-bit or 64-bit
- [AutoHotkey v2](https://www.autohotkey.com/v2/) (for the source code version)

## 3. How It Works

This application is created and compiled using AutoHotkey 2.0.17. It features a straightforward script that remaps the `F1` to `F12` keys to `F13` to `F24` when the Caps Lock key is pressed. Pressing the Caps Lock key again disables the remapping and restores the `F1` to `F12` keys.

Shift does not affect the remapping. For instance, if you press `Shift+F1` while Caps Lock is enabled, the system will interpret it as `Shift+F13`.

## 4. Potential Uses

This script is compatible with any application that supports the additional function keys (`F13`-`F24`), such as:

- DAWs (Digital Audio Workstations) like Bitwig Studio, Ableton Live, FL Studio, Cubase, etc.
- Graphic editors like Photoshop, GIMP, Krita, Inkscape, etc.
- CAD software like AutoCAD, SolidWorks, etc.
- Video editors like Adobe Premiere, DaVinci Resolve, etc.
- Broadcasting software like OBS, Streamlabs, etc.
- Code editors like Visual Studio Code, Atom, Sublime Text, etc.
- Other AutoHotkey scripts

## 5. Installation

### 5.1. Running the Script

1. Download and install [AutoHotkey v2](https://www.autohotkey.com/v2/).
2. Clone this repository.
3. Run the script by double-clicking the `.ahk` file.

### 5.2. I don't want to install AutoHotkey, I just want to use the `F13`-`F24` keys

To download the latest compiled executable without needing to install AutoHotkey, follow these steps:

1. Visit the [releases page](https://github.com/centomila/F13-F24-With-CapsLock-AHK-v2/releases) on GitHub.
2. Download the compiled `.exe` file from the repository. Choose between the 32-bit and 64-bit versions.
3. Run the downloaded executable by double-clicking the `.exe` file.

## 6. Usage

1. Use the Caps Lock key to switch between `F1`-`F12` and `F13`-`F24` functionalities.
2. Right-click on the systray icon to open the menu for _Help_, view the _About_, _License_ or to _Exit_ the application.
   - _Help_ open a simple message box with a help message in 5 languages (English, German, Spanish, French, Italian) detected by the OS language.
   - _About_ opens a message box with some info about the author in 5 languages (English, German, Spanish, French, Italian) detected by the OS language.
   - _License_ opens a message box with the MIT License (English only)
   - _Exit_ closes the application without asking for confirmation.
     - The compiled version also removes the content created in the user temp folder (`C:\Users\%USERNAME%\AppData\Local\Temp\F13F24` by default) during the script execution.

## 7. I don't want all this stuff! I just want to use the `F13`-`F24` keys in my script

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

## 8. License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 9. Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## 10. Changelog

See the [CHANGELOG.md](CHANGELOG.md) file for details.

## 11. Contact

If you have any questions or suggestions, feel free to open an issue on GitHub or contact me at [centomila.com](https://centomila.com/contact/).

---

Made with ❤️ by Centomila. If you found this application useful or inspiring, consider checking out my music and sharing it with others! You can find my discography at [centomila.com](https://centomila.com).
