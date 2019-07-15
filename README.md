# Brian's Key Customizer Script

This is basically just a stupid simple AutoHotkey script that I put together from a few pages and modified a little bit, to remap my keyboard on Windows the way I map it on macOS using Karabiner-Elements.

This AHK will:
  - Disable your Caps Lock key from activating Caps Lock
  - Remap Caps Lock to *both* ESC and Control
    - If you *press and release* caps, esc is triggered
    - If you *press and hold* caps, it acts as the Control key
        - (e.g., "Caps Lock + C" will be equivalent to "Ctrl + C")
  - Remap Tab to *both* Tab and Control
    - Like above, if you *press and release* Tab it will emit Tab
    - If you *press and hold* tab, your `H` `J` `K` `L` keys become arrows ala Vim (`←` `↓` `↑` `↓`)
  - Remap LShift + RShift to Caps Lock
  - Displays an icon in the system tray that shows your current caps lock state.

This AHK will NOT:
  - help you put your life back together.
  

Additionally, a configuration for [X-Mouse Button Control](https://www.highrez.co.uk/downloads/XMouseButtonControl.htm) is given to map a four-button (quadrant-style) trackball as I prefer, with drag scroll, some chording, and so on.
