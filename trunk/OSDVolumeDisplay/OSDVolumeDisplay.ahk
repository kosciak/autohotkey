;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         Wojciech 'KosciaK' Pietrzok <kosciak1@gmail.com>
;
; Script Function:
;	Control the Master Volume using keyboard
;	Win+ - Volume up by 5%
;	Win- - Volume down by 5%
;	Win0 - Sound on/off
;
; Script Version: 0.1
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; -----------------------------------
; 	Volume Control
; -----------------------------------

; Mute
#Numpad0::
#0::
	SoundSet,+1,,mute
	GoSub, DisplayMute
return

; Volume Up
#NumpadAdd::
#=::
	SoundSet +5  ; Increase master volume by 10%
	GoSub, DisplayVolume
return

; Volume Down
#NumpadSub::
#-::
	SoundSet -5  ; Decrease master volume by 10%
	GoSub, DisplayVolume
return

; Display current volume
DisplayVolume:
	SoundGet, volume
	SoundGet, soundmute,, mute
	if soundmute = On
		soundmute = OFF
	else
		soundmute = ON
		
	volume := Round(volume)
	
	IfWinNotExist, vol_progress 
	{
		Progress, b w300 fs11 zh10 wm550 ws700 fm8, %soundmute%, Volume, vol_progress
		Progress, %volume% 
	}
	else	
		Progress, %volume% 
		
	SetTimer, TurnProgressOff, -500 
return

; Display Sound On/Off
DisplayMute:
	SoundGet, soundmute,, mute
	if soundmute = On
		soundmute = OFF
	else
		soundmute = ON

	Progress, Off
	SplashImage,, b w300 fs11 zh0 wm550 ws700 fm8, %soundmute%, Volume, mute
	SetTimer, TurnSplashOff, -500
return

; Get rid of Progress bar and Splash Screen
TurnProgressOff:
Progress, Off
return

TurnSplashOff:
SplashImage, Off
return
