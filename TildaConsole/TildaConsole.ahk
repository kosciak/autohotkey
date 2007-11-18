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
; Script Version: 0.1
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
#`::
DetectHiddenWindows, on
IfWinExist ahk_class ATL:00456188
{
	
	IfWinActive ahk_class ATL:00456188
	  {
			WinHide ahk_class ATL:00456188
			; need to move the focus somewhere else.
			WinActivate ahk_class Shell_TrayWnd
		}
	else
	  {
	    WinShow ahk_class ATL:00456188
	    WinActivate ahk_class ATL:00456188
	  }
}
else
	Run "C:\Program Files\Console2\Console.exe" -c kosciak-big.xml -w Console
; the above assumes a shortcut in the c:\windows folder to console.exe.
; also assumes console is using the default console.xml file, or
; that the desired config file is set in the shortcut.

DetectHiddenWindows, off
return

; hide console on "esc".
#IfWinActive ahk_class ATL:00456188
esc::
 {
   WinHide ahk_class ATL:00456188
   WinActivate ahk_class Shell_TrayWnd
 }
return


