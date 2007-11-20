;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Monitors CapsLock, if on shows an icon in tray
;	
; Script Version: 0.1
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon
Menu, Tray, Icon, CL.ico
#Persistent
#SingleInstance force

PrevCapsState = %False%

Loop {
	GoSub, Check
	Sleep, 250
}

Check:
	CapsState := GetKeyState("Capslock", "T")
	If (%CapsState% = False) {
		Menu, Tray, NoIcon
	} Else {
		Menu, Tray, Icon
		If (%PrevCapsState% = False)
			TrayTip, , CapsLock
	}
	PrevCapsState = %CapsState%
return