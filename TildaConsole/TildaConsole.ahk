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
;	0.3		- Enabled Ctrl-V por pasting
;			- Added closing #IfWinActive directives
;			- Simplified Path pasting in Ctrl-Tilda
;	0.2		- Ctrl+Tilda for Explorer window acts as Console Here
;	0.1		- Initial Release, same as http://www.instructables.com/id/%22Drop-Down%22%2c-Quake-style-command-prompt-for-Window/
;
; Additional Info:
;	Change "ahk_class ATL:00456188" to what you get after inspecting Console's window
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; -----------------------------------
; Launch console if necessary; hide/show on Win+`
; -----------------------------------
#`::GoSub, ShowHide

; hide console on "esc".
#IfWinActive ahk_class ATL:00456188
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

	WinWait, ahk_class ATL:00456188
	SendPlay, {Ctrl Down}{F5}{Ctrl Up}pushd {Shift Down}{Insert}{Shift Up}{Enter} ;{Space}%DriveLetter%{SHIFTDOWN};{SHIFTUP}%Path%{Enter}
	clipboard = %ClipboardOld%
	
return
#IfWinActive

Hide:
 {
   WinHide ahk_class ATL:00456188
   WinActivate ahk_class Shell_TrayWnd
 }
return

ShowHide:
DetectHiddenWindows, on
IfWinExist ahk_class ATL:00456188
{
	
	IfWinActive ahk_class ATL:00456188
	  {
			GoSub, Hide
		}
	else
	  {
	    WinShow ahk_class ATL:00456188
	    WinActivate ahk_class ATL:00456188
	  }
}
else
	Run "C:\Program Files\Console2\Console.exe" -c kosciak-big.xml -w Console

DetectHiddenWindows, off
return

GetPath(){
	WinGetText, title
	position := InStr(title, "`n")
	path := SubStr(title, 1, position - 2)
	return path
}