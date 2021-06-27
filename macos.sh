defaults write -g com.apple.trackpad.scaling 7
defaults write .GlobalPreferences com.apple.mouse.scaling -1
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
defaults write com.apple.screencapture include-date -bool false; killall SystemUIServer

brew install bat ffmpeg gibo git httpie jq node radare2 rsync rust tree wget 
