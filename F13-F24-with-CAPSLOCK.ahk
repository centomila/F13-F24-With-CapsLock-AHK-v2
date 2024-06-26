; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.
Persistent  ; Keep the script running until the user exits it.
#SingleInstance force

AppName := "Centomila's F13-F24 with CapsLock"
AppVersion := "1.0.0"

HelpText := "Enable the Caps Lock key to use F13-F24 keys.`n`nDisable the Caps Lock key to use the normal F1-F12 keys."
AboutText := "This simple script is made with Love by Centomila.`n`n" .
            "If this is has been useful to you, consider listening or share my music. You can find links all my discography on `n`n" .
            "https://centomila.com"

if (A_IsCompiled) {
    ; Compiled version, use icon from the .exe file
    TraySetIcon(A_ScriptName)
} else {
    ; Source version, use the custom icon
    TraySetIcon("F13.ico")
}


Tray := A_TrayMenu
Tray.Delete()

Tray.Add(AppName, NoAction)  ; Creates a separator line.
Tray.Add() ; Creates a separator line.
Tray.Add("About", AboutMsg)  ; Creates a new menu item.
; Add pause script tray
Tray.Add("Exit", ExitApp)
Tray.Default := AppName

NoAction(*) {
    ; Do nothing.
}

AboutMsg(A_ThisMenuItem, A_ThisMenuItemPos, Tray) {
    MsgBox(AboutText, "About " . AppName)
}

ExitApp(*)
{
    ExitApp()
}

; Main app

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

; Autoreload on saving trick
#HotIf WinActive("Visual Studio Code")
~^s:: Reload
#HotIf