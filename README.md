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
	- If you *press and hold* tab, your `H` `J` `K` `L` keys become arrows ala Vim (`< V ^ >`)

TODO: Left Shift + Right Shift will toggle Caps Lock in next revision.
