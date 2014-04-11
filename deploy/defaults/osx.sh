#!/bin/sh

if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "$0 : Will only run on Darwin"
  exit 1
fi

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Disable press-and-hold for alternate keys so we can use key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a really fast key repeat.
defaults write NSGlobalDomain InitialKeyRepeat -int 4
defaults write NSGlobalDomain KeyRepeat -int 0

# Show remaining battery time; hide percentage
defaults write com.apple.menuextra.battery ShowPercent -string "NO"
defaults write com.apple.menuextra.battery ShowTime -string "YES"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable the “reopen windows when logging back in” option
# This works, although the checkbox will still appear to be checked,
# and the command needs to be entered again for every restart.
defaults write com.apple.loginwindow TALLogoutSavesState -bool false
defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable notification of iPad not charging
echo "Need root to disable iPad not charging notifications..."
sudo defaults write com.apple.usbd NoiPadNotifications -bool YES

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true


###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Scroll speed
defaults write ~/Library/Preferences/.GlobalPreferences com.apple.trackpad.scrolling 0.312

# Set language and text formats
defaults write NSGlobalDomain AppleLanguages -array "en"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Inches"
defaults write NSGlobalDomain AppleMetricUnits -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false


###############################################################################
# Screen                                                                      #
###############################################################################

# Require password soon after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 30

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Enable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool false

defaults write com.apple.ScreenSharing debug -bool true


###############################################################################
# Finder                                                                      #
###############################################################################

# Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 60

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Show folder contents in Quick Look
defaults write com.apple.finder QLEnableXRayFolders -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show devices on Desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show icon preview
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showIconPreview true" ~/Library/Preferences/com.apple.finder.plist

# Set label on side
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

# Show item info below desktop icons
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for desktop icons
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy name" ~/Library/Preferences/com.apple.finder.plist

# Empty Trash insecurely by default
defaults write com.apple.finder EmptyTrashSecurely -bool false

# Show the ~/Library folder
chflags nohidden ~/Library


###############################################################################
# Dock & hot corners                                                          #
###############################################################################

# Turn on Dock auto-hiding
defaults write com.apple.dock autohide -bool true

# Make the Dock appear on the left side
defaults write com.apple.dock orientation "left"

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 28

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Speed up Mission Control animations
#defaults write com.apple.dock expose-animation-duration -float 0.1

# Do not group windows by application in Mission Control
defaults write com.apple.dock "expose-group-by-app" -bool false

# Enable the 2D Dock
defaults write com.apple.dock no-glass -bool true

# Make the Dock 2D Black
defaults write com.apple.dock no-glass -int 1

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Enable iTunes track notifications in the Dock
#defaults write com.apple.dock itunes-notifications -bool true

# Reset Launchpad
find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete


# Hot corners
# Bottom left screen corner → Mission Control
defaults write com.apple.dock wvous-bl-corner -int 2
defaults write com.apple.dock wvous-bl-modifier -int 0
# Top left screen corner → Desktop
defaults write com.apple.dock wvous-tl-corner -int 4
defaults write com.apple.dock wvous-tl-modifier -int 0
# Bottom left screen corner → Start screen saver
#defaults write com.apple.dock wvous-bl-corner -int 5
#defaults write com.apple.dock wvous-bl-modifier -int 0


###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeDebugMenu -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Show Safari status bar
defaults write com.apple.Safari ShowStatusBar -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false


###############################################################################
# Address Book, Dashboard, iCal, iTunes, Mail, and Disk Utility               #
###############################################################################

# Enable the debug menu in Address Book
defaults write com.apple.addressbook ABShowDebugMenu -bool true

# Enable the debug menu in iCal
defaults write com.apple.iCal IncludeDebugMenu -bool true

# Disable send and reply animations in Mail.app
defaults write com.apple.Mail DisableReplyAnimations -bool true
defaults write com.apple.Mail DisableSendAnimations -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Make arrows link to library instead of App Store
defaults write com.apple.iTunes invertStoreLinks -bool true
defaults write com.apple.iTunes show-store-link-arrows -bool false

# Disable the Ping sidebar in iTunes
defaults write com.apple.iTunes disablePingSidebar -int 1

# Disable all the other Ping stuff in iTunes
defaults write com.apple.iTunes disablePing -bool true
defaults write com.apple.iTunes hide-ping-dropdown -bool true


# Make ⌘ + F focus the search input in iTunes
defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"

# Disable auto-playing when importing
defaults write com.apple.iTunes play-songs-while-importing -bool FALSE

# Disk Utilty Debug Menu
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true

# Advanced Disk Utility mode
defaults write com.apple.diskcopy expert-mode -bool true


###############################################################################
# Terminal                                                                    #
###############################################################################

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Enable “focus follows mouse” for Terminal.app and all X11 apps
# This means you can hover over a window and start typing in it without clicking first
#defaults write com.apple.terminal FocusFollowsMouse -bool true
#defaults write org.x.X11 wm_ffm -bool true


###############################################################################
# Xcode                                                                       #
###############################################################################

defaults write com.apple.dt.Xcode AlwaysShowTabBar -bool false
defaults write com.apple.dt.Xcode AssistantEditorsLayout -int 0
defaults write com.apple.dt.Xcode DVTConvertExistingFilesLineEndings -bool true
defaults write com.apple.dt.Xcode DVTFindBarIgnoreCase -bool true
defaults write com.apple.dt.Xcode DVTTextAlignConsecutiveSlashSlashComments -bool true
defaults write com.apple.dt.Xcode DVTTextEditorTrimWhitespaceOnlyLines -bool true
defaults write com.apple.dt.Xcode DVTTextPageGuideLocation -int 100
defaults write com.apple.dt.Xcode DVTTextShowLineNumbers -bool true
defaults write com.apple.dt.Xcode DVTTextShowPageGuide -bool true
defaults write com.apple.dt.Xcode IDEDisableGitSupportForNewProjects -bool true
defaults write com.apple.dt.Xcode ShowDVTDebugMenu -bool true

defaults write com.apple.dt.Xcode OMOpenInDashDisabled -bool false
defaults write com.apple.dt.Xcode OMOpenInDashStyle -int 2

defaults write com.apple.iphonesimulator SBFakeCarrier "Streeter"

###############################################################################
# Quicktime                                                                   #
###############################################################################

# Do not restore last active video
defaults write com.apple.QuickTimePlayerX NSQuitAlwaysKeepsWindows -bool false

###############################################################################
# Preview                                                                     #
###############################################################################

# Do not restore last active video
defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false

###############################################################################
# Time Machine                                                                #
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true


###############################################################################
# Tweetbot
###############################################################################

defaults write com.tapbots.TweetbotMac ShowTheTweetbots -bool true
defaults write com.tapbots.TweetbotMac TextAutoCorrect -bool YES
defaults write com.tapbots.TweetbotMac TextAutomaticQuoteSubstitution -bool YES
defaults write com.tapbots.TweetbotMac TextAutomaticTextReplacement -bool YES
defaults write com.tapbots.TweetbotMac TextContinuousSpellChecking -bool YES
defaults write com.tapbots.TweetbotMac displayNameType -int 3
defaults write com.tapbots.TweetbotMac fontSize -int 13
defaults write com.tapbots.TweetbotMac quoteFormatType -int 1
defaults write com.tapbots.TweetbotMac openURLInBackground -bool YES


###############################################################################
# Twitter.app                                                                 #
###############################################################################

# Disable smart quotes as it’s annoying for code tweets
defaults write com.twitter.twitter-mac AutomaticQuoteSubstitutionEnabled -bool false

# Show the app window when clicking the menu icon
defaults write com.twitter.twitter-mac MenuItemBehavior -int 1

# Enable the hidden ‘Develop’ menu
defaults write com.twitter.twitter-mac ShowDevelopMenu -bool true

# Open links in the background
defaults write com.twitter.twitter-mac openLinksInBackground -bool true

# Allow closing the ‘new tweet’ window by pressing `Esc`
defaults write com.twitter.twitter-mac ESCClosesComposeWindow -bool true

# Show full names rather than Twitter handles
defaults write com.twitter.twitter-mac ShowFullNames -bool true

# The compose window shouldn't float over everything
defaults write com.twitter.twitter-mac NormalComposeWindowLevel -bool true

###############################################################################
# Kill affected applications                                                  #
###############################################################################
for app in Finder Dock iCal Address\ Book SystemUIServer Twitter; do
    killall "$app" > /dev/null 2>&1;
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
