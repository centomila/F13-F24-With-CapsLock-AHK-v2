; This script enables the Caps Lock key to use F13-F24 keys.
; Disable the Caps Lock key to use the normal F1-F12 keys.

; Recommended for new scripts due to its superior speed and reliability.
SendMode("Input")

; Ensures a consistent starting directory.
SetWorkingDir(A_ScriptDir)

; Keep the script running until the user exits it.
Persistent

#SingleInstance force

; Define the application name and version.
AppName := "Centomila's F13-F24 with CapsLock"
AppVersion := "1.0.0"

; Define the help and about texts.
HelpText := "Enable the Caps Lock key to use F13-F24 keys.`n`nDisable the Caps Lock key to use the normal F1-F12 keys."
AboutText := "This simple script is made with Love  by Centomila.`n`n" .
            "If this has been useful to you, consider listening or sharing my music. You can find links to all my discography on `n`n`n" .
            "https://centomila.com"

; Define the icon file paths.
IconOff := A_ScriptDir . "\F13Icons\F13-OFF.ico"
IconOn := A_ScriptDir . "\F13Icons\F13-ON.ico"

; Install the icon files.
FileInstall IconOff, IconOff, 0
FileInstall IconOn, IconOn, 0

; Function to change the tray icon based on the Caps Lock state.
ChangeIcon() {
    if GetKeyState("CapsLock", "T") {
        TraySetIcon(IconOn)
        ToolTip "`nF13 | F24`n ", 9999,9999 ; Positioned at 9999,9999 so it is always on the lower right corner
    } else {
        TraySetIcon(IconOff)
        ToolTip "`nF1 | F12`n ", 9999,9999
    }
    SetTimer () => ToolTip(), -1500
}

; Execute ChangeIcon on startup.
ChangeIcon()

; Create the tray menu.
Tray := A_TrayMenu
Tray.Delete()

; Add the Help menu item.
Tray.Add(AppName, HelpMsg)

; Add a separator line.
Tray.Add()

; Add the About menu item.
Tray.Add("About", AboutMsg)

; Add the Exit menu item.
Tray.Add("Exit", ExitApp)

; Set the default menu item.
Tray.Default := AppName

; Function to display the Help box.
HelpMsg(A_ThisMenuItem, A_ThisMenuItemPos, Tray) {
    MsgBox(HelpText, "Help " . AppName . " " . AppVersion)
}

; Function to display the About box.
AboutMsg(A_ThisMenuItem, A_ThisMenuItemPos, Tray) {
    MsgBox(AboutText, "About " . AppName)
}

; Function to exit the application.
ExitApp(*) {
    ExitApp()
}

; Main app

~CapsLock:: ChangeIcon

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

; Autoreload on saving when using VSCode
#HotIf WinActive("Visual Studio Code")
~^s:: Reload
#HotIf