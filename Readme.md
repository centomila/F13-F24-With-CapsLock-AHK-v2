# Centomila's F13-F24 with CapsLock

Centomila's F13-F24 with CapsLock is a simple but useful AutoHotkey v2 (AHK2) script that enhances the functionality of the Caps Lock key. When Caps Lock is enabled, the `F1`-`F12` keys are remapped to `F13`-`F24`.

While this can be done in less of 20 lines of code, I wanted to created a script that cover many Autohotkey functionality that often are asked on the official Autohotkey Forum, Reddit and Stackoverflow communities. I tried to comment the script as much as possible without being too verbose.

This script demonstrates examples of
- Hotkeys with HotIf
- String concatenation
- Switch cases
- Caps Lock usage
- Customized systray menu
- Use of message boxes (_MsgBox_)
- Dynamic systray icon changes
- ToolTip text with absolute positioning in the right bottom corner
- Separate AHK files (_#include_)
- Installation of file from the compiled EXE (_FileInstall_)
- OS Language detection

## Description

This simple application remaps the `F1` to `F12` keys to `F13` to `F24` using the Caps Lock key, providing you with an additional 12 function keys.

## Requirements

- A Windows PC
- [AutoHotkey v2](https://www.autohotkey.com/v2/) (for running the script version)

## How It Works

This application is created and compiled using AutoHotkey. It features a straightforward script that remaps the `F1` to `F12` keys to `F13` to `F24` when the Caps Lock key is pressed. Pressing the Caps Lock key again disables the remapping and restores the `F1` to `F12` keys.

Shift does not affect the remapping. For instance, if you press `Shift+F1` while Caps Lock is enabled, the system will interpret it as `Shift+F13`.

## Potential Uses

This script is compatible with any application that supports the additional function keys (`F13`-`F24`), such as:

- DAWs (Digital Audio Workstations) like Bitwig Studio, Ableton Live, FL Studio, Cubase, etc.
- Graphic editors like Photoshop, GIMP, Krita, Inkscape, etc.
- CAD software like AutoCAD, SolidWorks, etc.
- Video editors like Adobe Premiere, DaVinci Resolve, etc.
- Broadcasting software like OBS, Streamlabs, etc.
- Code editors like Visual Studio Code, Atom, etc.
- Other AutoHotkey scripts

## Installation

### Running the Script

1. Download and install [AutoHotkey v2](https://www.autohotkey.com/v2/).
2. Clone this repository or download the script file.
3. Place the `F13Icons` folder with `F13-OFF.ico` and `F13-ON.ico` icons in the same directory as the script.
4. Run the script by double-clicking the `.ahk` file.

### Using the Compiled EXE

For users who do not want to install AutoHotkey and just need a utility to use the `F13`-`F24` keys, the repository contains a compiled executable:

1. Download the compiled `.exe` file from the repository.
2. Place the `F13Icons` folder with `F13-OFF.ico` and `F13-ON.ico` icons in the same directory as the executable.
3. Run the executable by double-clicking the `.exe` file.

## Usage

1. Use the Caps Lock key to switch between `F1`-`F12` and `F13`-`F24` functionalities.
2. Access the systray menu for Help, About, or to Exit the application.

## The Basic `F13`-`F24` Key Remapping

If you juste need a simple remapping of the `F1`-`F12` keys to implement in your script, this is all you need:

```ahk
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

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## Contact

If you have any questions or suggestions, feel free to contact me at [centomila.com](https://centomila.com).

---

Made with ❤️ by Centomila. If you found this script useful, consider checking out my music and sharing it with others! You can find my discography at [centomila.com](https://centomila.com).