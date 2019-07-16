; br's personal ahk keyboard remappings
; https://github.com/b-/keyboard-customizer
; Released into the Public Domain via CC0 https://creativecommons.org/share-your-work/public-domain/cc0/
;;;;;
; Run as administrator (the scheduled task included will do so on startup) for this to work on applications also running as administrator.
; Otherwise, the keyboard mappings will simply not work.
#SingleInstance Force
#InstallKeybdHook
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;functions
SetCaps(state) {
; Set the caps lock state
; The keyboard I'm coding this on doesn't have a capslock LED. Don't ask me why; it's a stupid laptop.
; Therefore I am using the tray icon as one.
  if (state = 0) {
    SetCapsLockState, alwaysoff ; Caps has to either be "alwaysoff" or "alwayson" because of the mappings involving it.
    Menu, Tray, Icon, %A_WorkingDir%/caps-off.png
    Menu, Tray, Tip, Key Customizer (caps off)
  }
  else if (state = 1) {
    SetCapsLockState, alwayson ; Caps has to either be "alwaysoff" or "alwayson" because of the mappings involving it
    Menu, Tray, Icon, %A_WorkingDir%/caps-on.png
    Menu, Tray, Tip, Key Customizer (CAPS ON)
  }
}
  
ToggleCaps() {
; Toggle caps lock
; This function is because we cannot simply send a Capslock keypress to reliably toggle the capslock state, due to remapping the key.

  if (GetKeyState("Capslock", "T") = 1) { ; if caps lock is on
    SetCaps(0) ; turn it off
  } else if (GetKeyState("Capslock", "T") = 0) ; else if caps lock is off
  {
    SetCaps(1) ; turn it on
  }
}
;;;;;;;;;;;;;;
; Turn off Caps on start: I can't seem to reliably get the state of caps lock upon program start, so I'm just manually setting it to off
SetCaps(0) 

*Tab::Send {Blind}{Tab} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

#If GetKeyState("Tab", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down
  h::Left
  l::Right
  Tab & F1::Return ;workaround for strange bug regarding "up". Apparently it's in some documentation?
  k::Up
  j::Down
#If ;endif

*Capslock::
  Send {LControl Down}
  KeyWait, CapsLock
  Send {LControl Up}
  if ( A_PriorKey = "CapsLock" )
  {
      Send {Esc}
  }
return

LShift & RShift::ToggleCaps() ; Toggle caps on 
RShift & LShift::ToggleCaps() ; Need to program both orders of shift keys for this to work properly.
