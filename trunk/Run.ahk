;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         Wojciech 'KosciaK' Pietrzok <kosciak1@gmail.com>
;
; Script Function:
;	Runs other scripts
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

applicationname = KosciaK's scripts

Menu,Tray,DeleteAll
Menu,Tray,NoStandard
Menu,Tray,Add,%applicationname%,ABOUT
Menu,Tray,Add
Menu,Tray,Default,%applicationname%
Menu,Tray,Add,&About...,ABOUT
Menu,Tray,Add,&Exit,EXIT
Menu,Tray,Tip,%applicationname%

Run, CapsLockIcon\CapsLockIcon.ahk

#Include KeyboardShortcuts\KeyboardShortcuts.ahk
#Include OSDVolumeDisplay\OSDVolumeDisplay.ahk
#Include TildaConsole\TildaConsole.ahk

ABOUT:
Text = - TildaConsole`n- OSDVolumeDisplay`n- CapsLockIcon`n- KeyboardShortcuts
MsgBox, 0, KosciaK's AutoHotKey scripts, %Text%
return

EXIT:
ExitApp