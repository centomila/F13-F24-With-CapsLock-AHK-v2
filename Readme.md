# Centomila's F13-F24 with CapsLock

Centomila's F13-F24 with CapsLock is a simple but useful AutoHotkey v2 (AHK2) script that enhances the functionality of the Caps Lock key. When Caps Lock is enabled, the F1-F12 keys are remapped to F13-F24. 

This script is heavily commented and also demonstrates examples of hotkeys, Caps Lock usage, systray menu, message box, and dynamic systray icon changes.

## Features

- **Caps Lock Remapping**: Use F13-F24 keys when Caps Lock is enabled, and revert to F1-F12 keys when Caps Lock is disabled.
- **Hotkeys**: Demonstrates the use of hotkeys with Caps Lock for launching functions and switching between mappings.
- **Systray Menu**: Demonstrate the use of the customization of the systray menu.
- **Dynamic Systray Icon**: Changes based on the state of Caps Lock.

## The basic F13-F24 key remapping

If you only want a simple remapping of the F1-F12 keys to implement in your script, you can use the following code:

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

Everything else in my script is nice but superfluous.

## Installation

1. Download and install [AutoHotkey v2](https://www.autohotkey.com/v2/).
2. Clone this repository or download the script file and the icons folder

## Usage

1. Run the script by double-clicking the `.ahk` file.
2. Use the Caps Lock key to switch between F1-F12 and F13-F24 functionalities.
3. Access the systray menu for Help, About, or to Exit the application.


## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## Contact

If you have any questions or suggestions, feel free to contact me at [centomila.com](https://centomila.com).

---

Made with ❤️ by Centomila. If you found this script useful, consider checking out my music and sharing it with others! You can find my discography at [centomila.com](https://centomila.com).