;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Monitors Insert, if on shows an icon in tray
;	
; Script Version: 0.1
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon
Menu, Tray, Icon, Ins.ico
#Persistent
#SingleInstance force

PrevInsertState = %True%

Loop {
	GoSub, Check
	Sleep, 250
}

Check:
	InsertState := GetKeyState("Insert", "T")
	If %InsertState% {
		Menu, Tray, NoIcon
	} Else {
		Menu, Tray, Icon
		If %PrevInsertState%
			TrayTip, , Insert

	}
	PrevInsertState = %InsertState%
return