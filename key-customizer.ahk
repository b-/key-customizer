; br's personal ahk keyboard remappings
; https://github.com/b-/keyboard-customizer
; Released into the Public Domain via CC0 https://creativecommons.org/share-your-work/public-domain/cc0/


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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Original author: fwompner gmail com
#InstallKeybdHook
SetCapsLockState, alwaysoff
*Capslock::
Send {LControl Down}
KeyWait, CapsLock
Send {LControl Up}
if ( A_PriorKey = "CapsLock" )
{
    Send {Esc}
}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;LShift + RShift = Caps
;Author: br (https://github.com/b-)
GetCapsState(){
  cstate := GetKeyState("Capslock", "T")
  if ( cstate = 1 ) {
    Menu, Tray, Icon, %A_WorkingDir%/caps-off.png
  } else {
    Menu, Tray, Icon, %A_WorkingDir%/caps-on.png
  }
  return cstate
}
GetCapsState()
ToggleCaps() {
  if GetCapsState() {
    SetCapsLockState, alwaysoff
  } else {
    SetCapsLockState, alwayson
  ;Send {Blind}{CapsLock}
  
	}
}
LShift & RShift::ToggleCaps()
RShift & LShift::ToggleCaps()
