-- Turn off Dock auto-hide to simulate system malfunction or surveillance
do shell script "defaults write com.apple.dock autohide -bool false && killall Dock"
