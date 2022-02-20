# ==============
# Interface & Behaviour Changes
# ==============


# Enable "save before exit" confirmation
defaults write -g NSCloseAlwaysConfirmsChanges -bool true

# Save to disk (not to iCloud) by default
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

# Expand print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app when all jobs are finished
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
# defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable App Nap for all apps
defaults write -g NSAppSleepDisabled -bool true

# Disable automatic termination of inactive apps
defaults write -g NSDisableAutomaticTermination -bool true

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Show IP, hostname, OS version etc. in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Screenshots
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"


# --------
# Software Updates & AppStore
# --------

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1


# --------
# Sound
# --------

# Increase sound quality for Bluetooth headphones/headsets
# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 4


# --------
# Finder
# --------

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Quit Finder from contextual menu or with Cmd + Q
defaults write com.apple.finder QuitMenuItem -bool true

# Show all files (incl. hidden files)
# defaults write com.apple.Finder AppleShowAllFiles -bool true

# Do not warn when changing file extensions
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Search scope
# This Mac: SCev, Current Folder: SCcf, Previous Scope: SCsp
defaults write com.apple.finder FXDefaultSearchScope SCcf

# View mode
# Icon: icnv, List: Nlsv, Column: clmv, Cover: Flwv
defaults write com.apple.finder FXPreferredViewStyle Nlsv
rm -f ~/.DS_Store

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Show full POSIX path as window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Enable spring loading for directories
defaults write -g com.apple.springing.enabled -bool true

# Decrease (0.5 -> 0.25) the spring loading delay for directories
defaults write -g com.apple.springing.delay -float 0.25




# --------
# Dock
# --------

# Auto-hide animation duration
defaults write com.apple.dock autohide-time-modifier -float 0.35

# Auto-hide delay
defaults write com.apple.dock autohide-delay -float 0

# Enable spring loading for all Dock items
# defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true




# --------
# Mouse & Trackpad
# --------

# Mouse tracking speed (between 0–3)
defaults write -g com.apple.mouse.scaling 2.5

# Mouse scrolling speed
defaults write -g com.apple.scrollwheel.scaling -int 5

# Trackpad tracking speed (between 0–3)
defaults write -g com.apple.trackpad.scaling 1

# Trackpad enable tap-to-click
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1

# Trackpad disable secondary click
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0

# Trackpad secondary click with two fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 1

# Trackpad secondary click with left corner
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 0

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
#defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
# Restore zoom factor on startup
defaults write com.apple.universalaccess closeViewRestoreZoomFactorOnStartup -bool true
# Do not Smooth images (it's ugly but useful for web dev.)
defaults write com.apple.universalaccess closeViewSmoothImages -bool false
# Follow the keyboard focus while zoomed in
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true
# Zoomed screen moves continously with pointer
defaults write com.apple.universalaccess closeViewPanningMode -int 0
# Zoomed screen moves only when the pointer reaches an edge
# defaults write com.apple.universalaccess closeViewPanningMode -int 1
# Zoomed screen moves so the pointer is at or near the center of the image
# defaults write com.apple.universalaccess closeViewPanningMode -int 2


# --------
# Keyboard & Text Behavior
# --------

# Prevent Music.app from responding to keyboard media keys
# launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
# defaults write -g AppleKeyboardUIMode -int 3

# Enable spell checker automatically language identification
# defaults write -g NSSpellCheckerAutomaticallyIdentifiesLanguages -bool true


# --------
# TextEdit
# --------

# Use plain text as default
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# --------
# Photos
# --------

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# --------
# Safari
# --------

# Disable search suggestions
defaults write com.apple.Safari UniversalSearchEnabled -bool false

# Suppress re-enabling search suggestions
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
