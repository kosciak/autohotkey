;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         Wojciech 'KosciaK' Pietrzok <kosciak1@gmail.com>
;
; Script Function:
;	Based on: http://www.instructables.com/id/%22Drop-Down%22%2c-Quake-style-command-prompt-for-Window/
;	Opens Console in a Quake style (at the top of the screen using Win+Tilda)
;	
; Script Version: 0.3
;
; Changelog:
;	0.4		- Option for creating new tab in Console Here
;	0.3		- Enabled Ctrl-V por pasting
;			- Added closing #IfWinActive directives
;			- Simplified Path pasting in Ctrl-Tilda
;	0.2		- Ctrl+Tilda for Explorer window acts as Console Here
;	0.1		- Initial Release, same as http://www.instructables.com/id/%22Drop-Down%22%2c-Quake-style-command-prompt-for-Window/
;
; Additional Info:
;	Change "Console2" to what you get after inspecting Console's window
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

SetUp:
	NewTab = 0		; Set to 1 if you want new tabs
return

; -----------------------------------
; Launch console if necessary; hide/show on Win+`
; -----------------------------------
#`::GoSub, ShowHide

; hide console on "esc".
#IfWinActive Console2
esc::GoSub, Hide

; Enable Ctrl-V shortcut for pasting
^v::Send {Shift Down}{Insert}{Shift Up}

#IfWinActive

; Ctrl+Tilda works as Console Here
#IfWinActive ahk_class CabinetWClass
^`::
	ClipboardOld = %clipboard%
	clipboard := GetPath()
	GoSub, ShowHide

	WinWait, Console2
	If (NewTab = 1)
		SendPlay, {Ctrl Down}{F5}{Ctrl Up}
	SendPlay, pushd {Shift Down}{Insert}{Shift Up}{Enter} ;{Space}%DriveLetter%{SHIFTDOWN};{SHIFTUP}%Path%{Enter}
	clipboard = %ClipboardOld%
	ClipBoardOld = 
return
#IfWinActive

Hide:
{
	WinHide Console2
	WinActivate ahk_class Shell_TrayWnd
}
return

ShowHide:
	DetectHiddenWindows, on
	IfWinExist Console2
	{
		IfWinActive Console2
			GoSub, Hide
		else {
			WinShow Console2
			WinActivate Console2
		}
	} else {
		GoSub, SetUp
		Run "C:\Program Files\Console2\Console.exe" -c kosciak-big.xml
	}
	DetectHiddenWindows, off
return

GetPath(){
	WinGetText, title
	position := InStr(title, "`n")
	path := SubStr(title, 1, position - 2)
	position := ""
	return path
}
