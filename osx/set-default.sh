# Show the ~/Library folder.
chflags nohidden ~/Library

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

#
# NSGlobalDomain
#

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 0

# Disable press-and-hold for keys in favor of key repeat.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# スペルチェックの停止
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false

# ダブルクオートの自動変換無効化
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# シングルクオートの自動変換無効化
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# テキストの自動置換無効化
defaults write NSGlobalDomain WebAutomaticTextReplacementEnabled -bool false

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Expand Save Panel by Default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Scrollbar Visibility
#   Possible values: WhenScrolling, Automatic and Always.
defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"

#
# com.apple.dock
#

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# 自動的に隠す
defaults write com.apple.dock autohide -bool true

# Dockの表示・非表示の待ち時間をなくす
defaults write com.apple.dock autohide-delay -int 0

# Mission Controlのアニメーション速度変更 (0.12が最速)
defaults write com.apple.dock expose-animation-duration -float 0.15

# Dockを左側に寄せる
defaults write com.apple.dock orientation -string left

#
# com.apple.desktopservices
#

# ネットワーク上には.DS_Storeを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#
# com.apple.NetworkBrowser
#

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

#
# com.apple.LaunchServices
#

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

#
# com.apple.Finder
#

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.Finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.Finder ShowRemovableMediaOnDesktop -bool true

# Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

#
# com.apple.Safari
#

# Enable Develop Menu and Web Inspector
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
                              "Dock" "Finder" "Mail" "Messages" \
                              "Safari" "SizeUp" "Spectacle" "SystemUIServer" \
                              "Transmission" "Twitter" "iCal"; do
    killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
