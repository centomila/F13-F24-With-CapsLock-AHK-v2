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
APP_NAME := "F13-F24 with CapsLock by Centomila"
APP_VERSION := "2.1.0"

; Settings for the compiled version (executable) only. -------------------------------------
TEMP_FOLDER := A_Temp . "\F13F24" ; Set the "TempFolder" variable to the "C:\Users\USERNAME\AppData\Local\Temp\F13F24" temporary directory.

if A_IsCompiled { ; This actions are only executed when the script is compiled (executable).
    ; Create the "F13F24" temporary directory if it doesn't exist.
    if not FileExist(TEMP_FOLDER) {
        DirCreate(TEMP_FOLDER)
    }
    
    ; Copy the "LICENSE" file to the "F13F24" temporary directory.
    FileInstall("LICENSE", TEMP_FOLDER . "\LICENSE", 1)
    
    ; Copy the "F13-OFF.ico" and "F13-ON.ico" files to the "F13F24" temporary directory.
    FileInstall("F13-OFF.ico", TEMP_FOLDER . "\F13-OFF.ico", 1)
    FileInstall("F13-ON.ico", TEMP_FOLDER . "\F13-ON.ico", 1)
    ; Copy the Centomila.ico file to the "F13F24" temporary directory.
    FileInstall("Centomila.ico", TEMP_FOLDER . "\Centomila.ico", 1)
}

; System tray Icons. ---------------------------------------------------------------------------
iconOff := "" ; Create the "IconOff" variable.
if A_IsCompiled { ; This actions are only executed when the script is compiled (executable).
    iconOff := TEMP_FOLDER . "\F13-OFF.ico" ; Set the "IconOff" variable to the "C:\Users\USERNAME\AppData\Local\Temp\F13F24\F13-OFF.ico" path.
} else { ; This actions are only executed when the script is not compiled (executable).
    iconOff := A_WorkingDir . "\F13-OFF.ico" ; Set the "IconOff" variable to the "current AHK directory\F13-OFF.ico" 
}

iconOn := "" ; Create the "IconOn" variable.
if A_IsCompiled { ; This actions are only executed when the script is compiled (executable).
    iconOn := TEMP_FOLDER . "\F13-ON.ico" ; Set the "IconOn" variable to the "C:\Users\USERNAME\AppData\Local\Temp\F13F24\F13-ON.ico" path.
} else { ; This actions are only executed when the script is not compiled (executable).
    iconOn := A_WorkingDir . "\F13-ON.ico" ; Set the "IconOn" variable to the "current AHK directory\F13-ON.ico"
}

iconCentomila := "" ; Create the "IconCentomila" variable.
if A_IsCompiled { ; This actions are only executed when the script is compiled (executable).
    iconCentomila := TEMP_FOLDER . "\Centomila.ico" ; Set the "IconCentomila" variable to the "C:\Users\USERNAME\AppData\Local\Temp\F13F24\Centomila.ico" path.
} else { ; This actions are only executed when the script is not compiled (executable).
    iconCentomila := A_WorkingDir . "\Centomila.ico" ; Set the "IconCentomila" variable to the "current AHK directory\Centomila.ico"
}

; Function to change the system tray icon based on the Caps Lock state.
ChangeIcon() {
    if GetKeyState("CapsLock", "T") { ; GetKeyState returns 1 if the Caps Lock key is pressed. T: Retrieve the toggle state.
        TraySetIcon(iconOn) ; Set the system tray icon to the "F13-ON.ico" icon.
        ToolTip "`nF13 | F24`n ", 9999, 9999 ; Positioned at 9999,9999 so it is always on the lower right corner
    } else {
        TraySetIcon(iconOff) ; Set the system tray icon to the "F13-OFF.ico" icon.
        ToolTip "`nF1 | F12`n ", 9999, 9999 ; Positioned at 9999,9999 so it is always on the lower right corner
    }
    SetTimer () => ToolTip(), -1500 ; Clear the tooltip after 1.5 seconds
}

ChangeIcon() ; Execute ChangeIcon on startup.

; the tilde (~) symbol before a hotkey tells AutoHotkey to allow the original function of the key to pass through.
; This means that the key will still perform its default action, in addition to executing the script you've defined.
~CapsLock:: ChangeIcon ; Execute the ChangeIcon function when the Caps Lock key is pressed.

; Define the license text files. --------------------------------------------------------------------
licenseMIT_En := ""

if A_IsCompiled {
    licenseMIT_En := FileRead(A_Temp . "\F13F24\LICENSE")
} else {
    licenseMIT_En := FileRead("LICENSE")
}


; Tray Menu -----------------------------------------------------------------------------------------
; Create the tray menu.
tray := A_TrayMenu
tray.Delete()

; Add the Help menu item.
tray.Add(APP_NAME, AboutMsg)
; Add an icon to the voice menu AppName
tray.SetIcon(APP_NAME, iconOff)
tray.Add("Help", HelpMsg)
; Add a separator line.
tray.Add()
; Add the About menu item.
tray.Add("About", AboutMsg)
; Add the MIT License menu item.
tray.Add("MIT License", LicenseMsg)
; Add the Exit menu item.
tray.Add("Exit", Quit)
; Set the default menu item.
tray.Default := APP_NAME
; Setting click count to 1 means that only 1 click is necessary on tray icon.
tray.ClickCount := 1

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

; Function to display the Help box. The content of HelpText_ is defined in the strings.ahk file imported via Include at the top of the script.
HelpMsg(A_ThisMenuItem, A_ThisMenuItemPos, Tray) {
    ; Using the returned value of DetectOsLanguage(), determine which HelpText to display
    switch (DetectOsLanguage()) {
        case "IT":  ; Italian
            selectedHelpText := helpText_IT
        case "DE":  ; German
            selectedHelpText := helpText_DE
        case "ES":  ; Spanish
            selectedHelpText := helpText_ES
        case "FR":  ; French
            selectedHelpText := helpText_FR
        default: ; English
            selectedHelpText := helpText_EN
        ; Add more cases for other languages if needed
    }

    ; Display MsgBox with selected help text
    MsgBox(selectedHelpText, "Help " . APP_NAME, "Iconi")
}

; Function to display the About usgin a GUI. The content of AboutText_ is defined in the Strings.ahk file.
AboutMsg(A_ThisMenuItem, A_ThisMenuItemPos, Tray) {
    ; Determine which AboutText to display based on the detected OS language
    switch (DetectOsLanguage()) {
        case "IT": selectedAboutText := aboutText_IT  ; Italian
        case "DE": selectedAboutText := aboutText_DE  ; German
        case "ES": selectedAboutText := aboutText_ES  ; Spanish
        case "FR": selectedAboutText := aboutText_FR  ; French
        default: selectedAboutText := aboutText_EN    ; English (default)
    }

    ; Check if the About window is already open
    if WinExist("About " . APP_NAME) {
        WinActivate  ; If it exists, just activate it
        return
    }

    ; Create and show the custom About dialog
    customGUI := Gui()
    customGUI.Title := "About " . APP_NAME
    customGUI.Opt("+AlwaysOnTop +DPIScale")
    customGUI.MarginX := 30  ; Set the X margin of the GUI
    customGUI.MarginY := 30  ; Set the Y margin of the GUI

    ; Add the icon
    aboutIcon := customGUI.Add("Picture", "w128 h-1", iconCentomila)

    ; Add the text and set its font
    aboutText := customGUI.Add("Text", "x+30 w700 h700", selectedAboutText)
    aboutText.SetFont("q5 s14", "Segoe UI")

    ; Add the Yes button and set its properties
    aboutBtnYes := customGUI.Add("Button", "w200 r3 x+-400 y+30", "Yes")
    aboutBtnYes.OnEvent("Click", (*) => (aboutAnswer := "Yes", customGUI.Destroy()))
    aboutBtnYes.SetFont("q5 s14", "Segoe UI")

    ; Add the No button and set its properties
    aboutBtnNo := customGUI.Add("Button", "w200 r3 x+30", "No")
    aboutBtnNo.OnEvent("Click", (*) => (aboutAnswer := "No", customGUI.Destroy()))
    aboutBtnNo.SetFont("q5 s14", "Segoe UI")

    ; Show the GUI centered on the screen
    customGUI.Show("xCenter yCenter AutoSize")

    ; Wait for user interaction
    aboutAnswer := ""
    while (aboutAnswer == "")
        Sleep(250)

    ; Handle the user's response
    if (aboutAnswer == "Yes") {
        Run "https://centomila.com"
    }
}


LicenseMsg(A_ThisMenuItem, A_ThisMenuItemPos, Tray) {
    MsgBox(licenseMIT_En, "MIT License " . APP_NAME . " " . APP_VERSION) ; Display MsgBox with selected License text.
}

; Function to exit the application.
Quit(*) {
    if A_IsCompiled { ; Delete the F13F24 temporary directory when the compiled exe is closed.
        DirDelete(A_Temp . "\F13F24", true) ; Delete the F13F24 temporary directory when the compiled exe is closed. True for recursive.
    }
    ExitApp()
}

; The main remap F1-F12 to F13-F24 function. -------------------------------------------------------------------
; Main remap F1-F12 to F13-F24 when the Caps Lock key is pressed.

#HotIf GetKeyState("CapsLock", "T") ; GetKeyState returns 1 if the Caps Lock key is pressed. T: Retrieve the toggle state.
F1::F13 ; F1 is remapped to F13
F2::F14 ; F2 is remapped to F14
F3::F15 ; F3 is remapped to F15
F4::F16 ; F4 is remapped to F16
F5::F17  ; F5 is remapped to F17
F6::F18 ; F6 is remapped to F18
F7::F19 ; F7 is remapped to F19
F8::F20 ; F8 is remapped to F20
F9::F21 ; F9 is remapped to F21
F10::F22 ; F10 is remapped to F22
F11::F23 ; F11 is remapped to F23
F12::F24 ; F12 is remapped to F24
#HotIf ; End of main remap F1-F12 to F13-F24 when the Caps Lock key is pressed.