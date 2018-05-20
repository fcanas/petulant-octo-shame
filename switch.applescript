use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions
tell application "Xcode"
	try
		set windowname to name of window 1
		set c to run script "on run arg 
			return " & text -1 of windowname & " of item 1 of arg
		end" with parameters {{m:"Jump to Previous Counterpart", h:"Jump to Next Counterpart"}}
		tell application "System Events"
			tell process "Xcode"
				click menu item c of menu "Navigate" of menu bar 1
			end tell
		end tell
	end try
end tell

