;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Tab & F1::Return ; Mentioned in the hotkeys docs for UP
*Tab::Send {Blind}{Tab} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

#If GetKeyState("Tab", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down

h::Left
l::Right
k::Up
j::Down

#If

; Author: fwompner gmail com
#InstallKeybdHook
SetCapsLockState, alwaysoff
Capslock::
Send {LControl Down}
KeyWait, CapsLock
Send {LControl Up}
if ( A_PriorKey = "CapsLock" )
{
    Send {Esc}
}
return
