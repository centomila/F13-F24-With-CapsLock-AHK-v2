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

; This is necessary for the compiled version. The 0 at the end avoid overwriting the existing icon.
FileInstall A_ScriptDir . "\F13Icons\F13.ico", A_ScriptDir . "\F13Icons\F13.ico", 0
FileInstall A_ScriptDir .  "\F13Icons\F13-ON.ico", A_ScriptDir .  "\F13Icons\F13-ON.ico", 0


ChangeIcon() {
    if GetKeyState("CapsLock", "T") {
    TraySetIcon(A_ScriptDir . "\F13Icons\F13-ON.ico")
    ToolTip "`nF13 | F24`n ", 9999,9999 ; Positioned at 9999,9999 so it is always on the lower right corner
    }
    else {
    TraySetIcon(A_ScriptDir . "\F13Icons\F13.ico")
    ToolTip "`nF1 | F12`n ", 9999,9999
    }
    SetTimer () => ToolTip(), -1500
}

; Execute ChangeIcon on startup
ChangeIcon()


Tray := A_TrayMenu
Tray.Delete()

Tray.Add(AppName, HelpMsg)  ; Launch the function to display the Help box.
Tray.Add() ; Creates a separator line.
Tray.Add("About", AboutMsg)  ; Launch the function to display the About box.
Tray.Add("Exit", ExitApp) ; Launch the function to exit the app.
Tray.Default := AppName ; Set the default menu item with the same name as the first added menu item (AppName).


HelpMsg(A_ThisMenuItem, A_ThisMenuItemPos, Tray) {
    MsgBox(HelpText, "Help " . AppName)
}

AboutMsg(A_ThisMenuItem, A_ThisMenuItemPos, Tray) {
    MsgBox(AboutText, "About " . AppName)
}

ExitApp(*)
{
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
    
    ; Add here additioal remapping to works with CapsLock enabled

#HotIf

; Autoreload on saving when using VSCode
#HotIf WinActive("Visual Studio Code")
~^s:: Reload
#HotIf