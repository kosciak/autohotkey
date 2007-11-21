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

Run, CapsLockIcon\CapsLockIcon.ahk

#Include KeyboardShortcuts\KeyboardShortcuts.ahk
#Include OSDVolumeDisplay\OSDVolumeDisplay.ahk
#Include TildaConsole\TildaConsole.ahk
