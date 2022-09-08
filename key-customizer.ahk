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

;UpdateIcon()
InitialCapsState := GetKeyState("Capslock", "T")
SetCapsIcon(InitialCapsState)
;;;;; Turn off Caps on start: I can't seem to reliably get the state of caps lock upon program start, so I'm just manually setting it to off
;;;;SetCaps(0) 

SetNumLockState, AlwaysOn
NumLock::Delete ; remap numlock to what clears calc on windows


;;;;;;;;;;;;;functions;;;;;;;;;;;;
SetCaps(state) {
  ; Set the caps lock state
  Switch state
  {
    case 0:
      SetCapsLockState, alwaysoff ; Caps has to either be "alwaysoff" or "alwayson" because of the mappings involving it.
      SetCapsIcon(0)
      ;UpdateIcon()
      Return
    case 1:
      SetCapsLockState, alwayson ; Caps has to either be "alwaysoff" or "alwayson" because of the mappings involving it
      SetCapsIcon(1)
      ;UpdateIcon()
      Return
  }
}

UpdateIcon() {
  Switch GetKeyState("Capslock", "T"){
    case 0:
      SetCapsIcon(0)
      Return
    case 1:
      SetCapsIcon(1)
      Return
  }
}

SetCapsIcon(State) {
  Switch state
  {
    case 0:
      Menu, Tray, Icon, %A_ScriptDir%/caps-off.png
      Menu, Tray, Tip, Key Customizer (caps off)
      Return
    case 1:
      Menu, Tray, Icon, %A_ScriptDir%/caps-on.png
      Menu, Tray, Tip, Key Customizer (CAPS ON)
      Return
  }
}
ToggleCaps() {
  ; Toggle caps lock
  ; This function is because we cannot simply send a Capslock keypress to reliably toggle the capslock state, due to remapping the key.
  Switch GetKeyState("Capslock", "T") {
    case 0:
      SetCaps(1)
      Return
    case 1:
      SetCaps(0)
    Return
  }
}
;;;;;;;;;;;;;;

;tab/arrow settings
*Tab::Send {Blind}{Tab} ; Send tab explicitly when no other key is pressed before letting go, including any modifiers being held
#If GetKeyState("Tab", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down
  h::Left
  l::Right
  Tab & F1::Return ;workaround for strange bug regarding "up". Apparently it's in some documentation?
  k::Up
  j::Down
#If ;endif

*Capslock::
  Send {LControl Down}
  sendEsc := true ; initialize it as true.
  KeyWait, CapsLock, T0.25 ; Wait for CapsLock to be released. timeout after 250ms
  if ( ErrorLevel >= 1) ; ErrorLevel = 1 if timeout. That is, if we never released caps
  {
    sendEsc := false ; if we don't release caps quickly, we shouldn't press once we finally release it.
  }
  KeyWait, CapsLock  ; We still need to wait for the key to be released; KeyWait is synchronous, so the program pauses while we do this.
  Send {LControl Up}
  if ( A_PriorKey = "CapsLock" ) && ( sendEsc == true ) ; if we never pressed another key AND if we didn't set sendEsc to false by timing out
  {
      Send {Esc} ; only then do we send esc.
  }
return

LShift & RShift::ToggleCaps() ; Toggle caps on 
RShift & LShift::ToggleCaps() ; Need to program both orders of shift keys for this to work properly.
