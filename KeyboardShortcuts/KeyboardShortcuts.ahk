;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         Wojciech 'KosciaK' Pietrzok <kosciak1@gmail.com>
;
; Script Function:
;	New keyboard shortcuts
;
; Script Version: 0.1
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; -----------------------------------
; 	Set new keyboard shortcuts
; -----------------------------------

; Assign Ctrl-Alt-R as a hotkey to restart the script.
^!r::Reload  

; Use Win + Capslock to minimize Window
!Capslock::WinMinimize,A

; Open Drives by Win-Shift-DriveLetter
#+A::run a:\
#+C::run c:\
#+D::run d:\
#+F::run f:\

