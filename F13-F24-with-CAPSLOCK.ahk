#Requires AutoHotkey v2.0
#SingleInstance force
Persistent

; This script remap the F1-F12 keys to F13-F24 when the Caps Lock key is pressed.
; Pressing the Caps Lock key again disables the remapping and restores the F1-F12 keys.

; Includes --------------------------------------------------------------------------
; Include the file strings.ahk to avoid super long script lines.
#include Strings.ahk
; Include the file autoreload-on-save.ahk that autoreload the script when it is saved.
#Include autoreload-on-save.ahk

; Define the application name and version.
AppName := "F13-F24 with CapsLock by Centomila"
AppVersion := "2.0.0"

; Settings for the compiled version (executable) only. -------------------------------------
TempFolder := A_Temp . "\F13F24"

if A_IsCompiled {
    ; Create the "F13F24" temporary directory if it doesn't exist.
    if not FileExist(TempFolder) {
        DirCreate(TempFolder)
    }
    FileInstall("LICENSE", TempFolder . "\LICENSE", 1)
    FileInstall("F13-OFF.ico", TempFolder . "\F13-OFF.ico", 1)
    FileInstall("F13-ON.ico", TempFolder . "\F13-ON.ico", 1)
}

; Systray Icons. ---------------------------------------------------------------------------
IconOff := ""
if A_IsCompiled {
    IconOff := TempFolder . "\F13-OFF.ico"
} else {
    IconOff := A_WorkingDir . "\F13-OFF.ico"
}

IconOn := ""
if A_IsCompiled {
    IconOn := TempFolder . "\F13-ON.ico"
} else {
    IconOn := A_WorkingDir . "\F13-ON.ico"
}

; Function to change the tray icon based on the Caps Lock state.
ChangeIcon() {
    if GetKeyState("CapsLock", "T") {
        TraySetIcon(IconOn)
        ToolTip "`nF13 | F24`n ", 9999, 9999 ; Positioned at 9999,9999 so it is always on the lower right corner
    } else {
        TraySetIcon(IconOff)
        ToolTip "`nF1 | F12`n ", 9999, 9999
    }
    SetTimer () => ToolTip(), -1500 ; Clear the tooltip after 1.5 seconds
}
; Execute ChangeIcon on startup.
ChangeIcon()

; the tilde (~) symbol before a hotkey tells AutoHotkey to allow the original function of the key to pass through.
; This means that the key will still perform its default action, in addition to executing the script you've defined.
~CapsLock:: ChangeIcon ; Execute the ChangeIcon function when the Caps Lock key is pressed.


; Define the license text files.
LicenseMIT_En := ""
LicenseMIT_De := ""
LicenseMIT_Es := ""
LicenseMIT_Fr := ""
LicenseMIT_It := ""

if A_IsCompiled {
    LicenseMIT_En := FileRead(A_Temp . "\F13F24\LICENSE")
} else {
    LicenseMIT_En := FileRead("LICENSE")
}


; Tray Menu -----------------------------------------------------------------------------------------
; Create the tray menu.
Tray := A_TrayMenu
Tray.Delete()

; Add the Help menu item.
Tray.Add(AppName, HelpMsg)
; Add a separator line.
Tray.Add()
; Add the About menu item.
Tray.Add("About", AboutMsg)
; Add the MIT License menu item.
Tray.Add("MIT License", LicenseMsg)
; Add the Exit menu item.
Tray.Add("Exit", Quit)
; Set the default menu item.
Tray.Default := AppName

; Functions -----------------------------------------------------------------------------------------
; Detect the language of the operating system and convert the language code to an ISO 639-1 code (EN, IT, etc.)
DetectOsLanguage() {
    switch A_Language {
        ; Italian
        case "0010", "0410", "0810":
            return "IT"
            ; German
        case "0007", "0C07", "0407", "1407", "1007", "0807":
            return "DE"
            ; Spanish
        case "000A":
            return "ES"
            ; French
        case "000C", "080C", "2C0C", "0C0C", "1C0C", "300C", "040C", "3C0C", "140C", "340C", "180C", "380C", "200C", "280C", "100C", "240C":
            return "FR"
            ; English
        default:
            return "EN"
    }
}

; Function to display the Help box. The content of HelpText_ is defined in the Strings.ahk file.
HelpMsg(A_ThisMenuItem, A_ThisMenuItemPos, Tray) {
    ; Set default language in case A_Language is not set or recognized
    selectedHelpText := HelpText_EN  ; Default to English

    ; Using the returned value of DetectOsLanguage(), determine which HelpText to display
    switch (DetectOsLanguage()) {
        case "IT":  ; Italian
            selectedHelpText := HelpText_IT
        case "DE":  ; German
            selectedHelpText := HelpText_DE
        case "ES":  ; Spanish
            selectedHelpText := HelpText_ES
        case "FR":  ; French
            selectedHelpText := HelpText_FR
            ; Add more cases for other languages if needed
    }

    ; Display MsgBox with selected help text
    MsgBox(selectedHelpText, "Help " . AppName)
}

; Function to display the About box. The content of AboutText_ is defined in the Strings.ahk file.
AboutMsg(A_ThisMenuItem, A_ThisMenuItemPos, Tray) {
    ; Set default language in case A_Language is not set or recognized
    selectedAboutText := AboutText_EN  ; Default to English

    ; Using the returned value of DetectOsLanguage(), determine which AboutText to display
    switch (DetectOsLanguage()) {
        case "IT":  ; Italian
            selectedAboutText := AboutText_IT
        case "DE":  ; German
            selectedAboutText := AboutText_DE
        case "ES":  ; Spanish
            selectedAboutText := AboutText_ES
        case "FR":  ; French
            selectedAboutText := AboutText_FR
            ; Add more cases for other languages if needed
    }

    ; Display MsgBox with selected About text. Add a YES-NO button. Yes open the website, no close the msgbox.
    AboutAnswer := MsgBox(selectedAboutText, "About " . AppName, "YesNo")

    if AboutAnswer = "Yes" {
        Run "https://centomila.com"
    }
}


LicenseMsg(A_ThisMenuItem, A_ThisMenuItemPos, Tray) {
    MsgBox(LicenseMIT_En, "MIT License " . AppName . " " . AppVersion)
}

; Function to exit the application.

Quit(*) {
    if A_IsCompiled {
        DirDelete(A_Temp . "\F13F24", true) ; Delete the F13F24 temporary directory when the compiled exe is closed. True for recursive.
    }
    ExitApp()
}

; The main remap F1-F12 to F13-F24 function. -------------------------------------------------------------------
; Main remap F1-F12 to F13-F24 when the Caps Lock key is pressed.

#HotIf GetKeyState("CapsLock", "T") ; GetKeyState returns 1 if the Caps Lock key is pressed. T: Retrieve the toggle state.
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