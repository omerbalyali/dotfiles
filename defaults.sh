#!/usr/bin/env bash

# macOS defaults by Ömer Balyali<omerbalyali@gmail.com>
# All settings were tested on macOS Monterey 12.0.1

echo '\n'
echo '🟡 Setting up macOS Monterey with preferred defaults:'


############
# LOCALIZATION

#---

# Languages

# English (US)
# defaults write -g AppleLanguages -array "en-US"

# English (US), Deutsch (DE)
defaults write -g AppleLanguages -array "en-US" "de-DE"

#---

# Locale

# English (DE)
defaults write -g AppleLocale -string "en_DE"

#---

# Measurement Units

# Centimeters
defaults write -g AppleMeasurementUnits Centimeters

# Inches
# defaults write -g AppleMeasurementUnits Inches

#---

# Metric Units
defaults write -g AppleMetricUnits -bool true

# Imperial Units
# defaults write -g AppleMetricUnits -bool false

#---

# Temperature

# Celcius
defaults write -g AppleTemperatureUnit Celsius

# Fahrenheit
# defaults write -g AppleTemperatureUnit Fahrenheit

#---


############
# TEXT

# Word Capitalization
defaults write -g NSAutomaticCapitalizationEnabled -bool false

# Spelling Correction
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Double-space after period
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false

# Smart Dashes
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false

# Smart Quotes
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false

# Automatic Text Completion
defaults write -g NSAutomaticTextCompletionEnabled -bool false



############
# KEYBOARD

# Key Repeat (2, 6, 12, 30, 60, 90, 120)
defaults delete -g "InitialKeyRepeat_Level_Saved" &> /dev/null
defaults write -g KeyRepeat -int 2

# Delay Before Key Repeat
defaults write -g InitialKeyRepeat -int 15


############
# ACCESSIBILITY

# Reduce Motion
# defaults write com.apple.accessibility ReduceMotionEnabled -bool true
# defaults write com.apple.universalaccess reduceMotion -bool true

# Reduce Transparency
# defaults write com.apple.universalaccess reduceTransparency -bool true

# Window Title Bar Icons (!!! NOT WORKING !!!)
sudo defaults write com.apple.universalaccess showWindowTitlebarIcons -bool true

# Invert Colors (???)
# defaults write com.apple.accessibility DarkenSystemColors -bool true
# defaults write com.apple.accessibility EnhancedBackgroundContrastEnabled -bool true

# Enable Full Keyboard Access
# defaults write com.apple.accessibility FullKeyboardAccessEnabled -bool true

# Use scroll gesture with the Ctrl (^) modifier key to zoom
sudo defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true

# Zoomed image moves, continously with the pointer
# defaults write com.apple.universalaccess closeViewPanningMode -int 0

# Zoomed image moves, when the pointer reaches an edge
sudo defaults write com.apple.universalaccess closeViewPanningMode -int 1

# Zoomed image moves, so the pointer is at the center of the image
# defaults write com.apple.universalaccess closeViewPanningMode -int 2

# Smooth Images
sudo defaults write com.apple.universalaccess closeViewSmoothImages -bool false

# Switch Control

# Capitalize sentences automatically 
sudo defaults write com.apple.universalaccess AssistiveControlAutomaticShiftEnabled -bool false


############
# APPEARANCE / GENERAL

#---

# UI Theme

# Light
# defaults delete -g AppleInterfaceStyle &> /dev/null
# defaults delete -g AppleInterfaceStyleSwitchesAutomatically &> /dev/null

# Dark
# defaults delete -g AppleInterfaceStyle &> /dev/null
# defaults delete -g AppleInterfaceStyleSwitchesAutomatically &> /dev/null
# defaults write -g AppleInterfaceStyle -string "Dark"

# Automatic
defaults delete -g AppleInterfaceStyle &> /dev/null
defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool true

#---

# Accent Color

# Multicolor
# defaults delete -g AppleAccentColor
# defaults write -g AppleAquaColorVariant -int 1
# defaults delete -g AppleHighlightColor

# Blue
# defaults write -g AppleAccentColor -int 4
# defaults write -g AppleAquaColorVariant -int 1
# defaults write -g AppleHighlightColor -string "0.698039 0.843137 1.000000 Blue"

# Purple
# defaults write -g AppleAccentColor -int 5
# defaults write -g AppleAquaColorVariant -int 1
# defaults write -g AppleHighlightColor -string "0.968627 0.831373 1.000000 Purple"

# Pink
# defaults write -g AppleAccentColor -int 6
# defaults write -g AppleAquaColorVariant -int 1
# defaults write -g AppleHighlightColor -string "1.000000 0.749020 0.823529 Pink"

# Red
# defaults write -g AppleAccentColor -int 0
# defaults write -g AppleAquaColorVariant -int 1
# defaults write -g AppleHighlightColor -string "1.000000 0.733333 0.721569 Red"

# Orange
# defaults write -g AppleAccentColor -int 1
# defaults write -g AppleAquaColorVariant -int 1
# defaults write -g AppleHighlightColor -string "1.000000 0.874510 0.701961 Orange"

# Yellow
# defaults write -g AppleAccentColor -int 2
# defaults write -g AppleAquaColorVariant -int 1
# defaults write -g AppleHighlightColor -string "1.000000 0.937255 0.690196 Yellow"

# Green
# defaults write -g AppleAccentColor -int 3
# defaults write -g AppleAquaColorVariant -int 1
# defaults write -g AppleHighlightColor -string "0.752941 0.964706 0.678431 Green"

# Graphite
# defaults write -g AppleAccentColor -int -1
# defaults write -g AppleAquaColorVariant -int 6
# defaults write -g AppleHighlightColor -string "0.847059 0.847059 0.862745 Graphite"

#---

# Highlight Color (If it's different than accent color)

# Blue
# defaults write -g AppleHighlightColor "0.698039 0.843137 1.000000 Blue"

# Purple
# defaults write -g AppleHighlightColor "0.968627 0.831373 1.000000 Purple"

# Pink
# defaults write -g AppleHighlightColor "1.000000 0.749020 0.823529 Pink"

# Red
# defaults write -g AppleHighlightColor "1.000000 0.733333 0.721569 Red"

# Orange
# defaults write -g AppleHighlightColor "1.000000 0.874510 0.701961 Orange"

# Yellow
# defaults write -g AppleHighlightColor "1.000000 0.937255 0.690196 Yellow"

# Green
# defaults write -g AppleHighlightColor "0.752941 0.964706 0.678431 Green"

# Graphite
# defaults write -g AppleHighlightColor "0.752941 0.964706 0.678431 Green"

# Other Color
# defaults write -g AppleHighlightColor "0.000000 0.885910 0.672518 Other"

#---

# Sidebar icon size

# Small
# defaults write -g NSTableViewDefaultSizeMode -int 1

# Medium
defaults write -g NSTableViewDefaultSizeMode -int 2

# Large
# defaults write -g NSTableViewDefaultSizeMode -int 3

#---

# Allow wallpaper tinting in windows
defaults write -g AppleReduceDesktopTinting -bool true

#---

# Show scroll bars automatically based on mouse or trackpad
defaults write -g AppleShowScrollBars -string WhenScrolling

# Show scroll bars when Scrolling
defaults write -g AppleShowScrollBars -string WhenScrolling

# Always show scroll bars
defaults write -g AppleShowScrollBars -string WhenScrolling

#---

# Click in the scrollbar to jump to the next page
defaults write -g AppleScrollerPagingBehavior -bool false

# Click in the scrollbar to jump to the spot that's clicked
# defaults write -g AppleScrollerPagingBehavior -bool true

#---

# Prefer Tabs

# Never
defaults write -g AppleWindowTabbingMode -string manual

# In full screen
defaults write -g AppleWindowTabbingMode -string fullscreen

# Always
defaults write -g AppleWindowTabbingMode -string always



############
# BEHAVIOUR

#---

# Show all file extensions
defaults write -g AppleShowAllExtensions -bool true

#---

# Show all files (incl. hidden files)
# defaults write com.apple.Finder AppleShowAllFiles -bool true

#---

# Empty trash without asking
defaults write com.apple.finder WarnOnEmptyTrash -bool false

#---

# Avoid creating .DS_Store files on network and USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

#---

# Ask to keep changes when closing documents
defaults write -g NSCloseAlwaysConfirmsChanges -bool true

#---

# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true



############
# FINDER

# Show Hard Disks on the Desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true

# Show External Disks on the Desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# Show Removal Media (CDs, DVDs and iPods ) on the Desktop
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show Mounted Servers on the Desktop
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

#-----------
# New Window Target
# PfCm PfVo PfHm PfDe PfDo PfAf PfLo
defaults write com.apple.finder NewWindowTarget -string "PfHm"

# New Finder window shows Computer
# defaults write com.apple.finder NewWindowTarget -string "PfCm"

# New Finder window shows Volume
# defaults write com.apple.finder NewWindowTarget -string "PfVo"

# New Finder window shows Desktop
# defaults write com.apple.finder NewWindowTarget -string "PfDe"

# New Finder window shows Downloads
# defaults write com.apple.finder NewWindowTarget -string "PfDo"

# New Finder window shows Custom Location
# defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Projects"

# Open folders in new tab
defaults write com.apple.finder FinderSpawnTab -bool true

# Open folders in new window
# defaults write com.apple.finder FinderSpawnTab -bool false

# Show specific sections in Get Info window
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    MetaData -bool true \
    OpenWith -bool true \
    Privileges -bool true
    # Name -bool true \
    # Comments -bool true \



############
# DOCK

# Icon size
defaults write com.apple.dock tilesize -int 48

# Magnification
defaults write com.apple.dock magnification -bool false

# Magnified icon size
defaults write com.apple.dock largesize -int 72

# Auto-hide Dock
defaults write com.apple.dock autohide -bool true

#-----------
# Position

# Position - Left
# defaults write com.apple.dock orientation -string left

# Position - Right
# defaults write com.apple.dock orientation -string right

# Position - Bottom
defaults write com.apple.dock orientation -string bottom

#-----------
# Minimize

# Minimize windows using Genie effect
# defaults write com.apple.dock mineffect -string genie

# Minimize windows using Scale effect
defaults write com.apple.dock mineffect -string scale

# Minimize windows using Suck effect (hidden in GUI)
# defaults write com.apple.dock mineffect -string suck

# Double-click a window's title bar to Zoom (Maximize to fit screen)
defaults write -g AppleActionOnDoubleClick -string Maximize

# Double-click a window's title bar to Minimize to Dock
# defaults write -g AppleActionOnDoubleClick -string Minimize

# Double-click a window's title bar does nothing (off)
# defaults write -g AppleActionOnDoubleClick -string None

# Minimize windows into application icon
# defaults write com.apple.dock "minimize-to-application" -bool true

# Animate opening applications
defaults write com.apple.dock launchanim -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Show indicators for open applications
defaults write com.apple.dock "show-process-indicators" -bool true

# Show recent applications in Dock
defaults write com.apple.dock "show-recents" -bool false



############
# MENU BAR

# Automatically hide and show the menu bar on desktop (Should be hidden?)
defaults write -g "_HIHideMenuBar" -bool false

# Automatically hide and show the menu bar in full screen (Should be visible?)
defaults write -g AppleMenuBarVisibleInFullscreen -bool false

# Wi-Fi Menu Visibility (NOT WORKING?)
defaults write com.apple.controlcenter "NSStatusItem Visible WiFi" -bool false


############
# MISSION CONTROL

# Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock "mru-spaces" -bool false

# When switching to an application, switch to a Space with open windows for the application
defaults write -g AppleSpacesSwitchOnActivate -bool true

# Group windows by applicaiton in Mission Control
defaults write com.apple.dock expose-group-apps -bool true

# Displays have separate Spaces
# defaults write com.apple.spaces "spans-displays" -bool true


#-----------
# Mission Control Shortcuts

# Mission Control

# Application Windows

# Desktop



############
# HOT CORNERS

# ACTIONS
# 1: Off
# 2: Mission Control
# 3: Application Windows
# 4: Desktop
# 5: Start Screen Saver
# 6: Disable Screen Saver
# 10: Put Display to Sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# 14: Quick Note

# MODIFIERS
# Off: 0
# Shift: 2^17 or 131072
# Cntrl: 2^18 or 262144
# Opt: 2^19 or 524288
# Cmd: 2^20 or 1048576

# Top Left
defaults write com.apple.dock "wvous-tl-corner" -int 13
defaults write com.apple.dock "wvous-tl-modifier" -int 524288
# Disable
# defaults delete com.apple.dock "wvous-tl-corner"
# defaults delete com.apple.dock "wvous-tl-modifier"


# Top Right
defaults write com.apple.dock "wvous-tr-corner" -int 4
defaults write com.apple.dock "wvous-tr-modifier" -int 524288
# Disable
# defaults delete com.apple.dock "wvous-tr-corner"
# defaults delete com.apple.dock "wvous-tr-modifier"

# Bottom Right
defaults write com.apple.dock "wvous-br-corner" -int 7
defaults write com.apple.dock "wvous-br-modifier" -int 524288
# Disable
# defaults delete com.apple.dock "wvous-br-corner"
# defaults delete com.apple.dock "wvous-br-modifier"

# Bottom Left
defaults write com.apple.dock "wvous-bl-corner" -int 1
defaults write com.apple.dock "wvous-bl-modifier" -int 0
# Disable
# defaults delete com.apple.dock "wvous-bl-corner"
# defaults delete com.apple.dock "wvous-bl-modifier"


killall Finder
killall Dock



echo '\n'
echo '🟢 macOS Monterey preferred defaults are setup.'
echo '\n'