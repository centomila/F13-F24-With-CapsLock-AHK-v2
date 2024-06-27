#Requires AutoHotkey v2.0


; Autoreload on saving when using VSCode and is not compiled (executable)
#HotIf WinActive("Visual Studio Code") and !A_IsCompiled
~^s:: Reload
#HotIf

