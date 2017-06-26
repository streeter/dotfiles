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
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -float 1.98

# Show remaining battery time; hide percentage
defaults write com.apple.menuextra.battery ShowPercent -bool true
defaults write com.apple.menuextra.battery ShowTime -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

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
sudo defaults write com.apple.usbd NoiPadNotifications -bool true

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true


###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Scroll speed
#defaults write ~/Library/Preferences/.GlobalPreferences com.apple.trackpad.scrolling 0.312

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
defaults write com.apple.screensaver askForPassword -bool true
defaults write com.apple.screensaver askForPasswordDelay -int 60

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Enable shadow in screenshots
defaults write com.apple.screencapture "disable-shadow" -bool false

defaults write com.apple.ScreenSharing debug -bool true


###############################################################################
# Finder                                                                      #
###############################################################################

# Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Do not show the preview pane
defaults write com.apple.finder ShowPreviewPane -bool false

# Show all desktop icons
defaults write com.apple.finder CreateDesktop -bool true

# Save to disk by default, not iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

defaults write com.apple.finder ShowTabView -bool false
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder SidebarWidth -int 185
defaults write com.apple.finder NewWindowTargetPath "file:///Users/streeter/"

# Allow text selection in Quick Look
# Do not enable this. It causes images to stop working.
# http://apple.stackexchange.com/a/140802
#defaults write com.apple.finder QLEnableTextSelection -bool true

# Show folder contents in Quick Look
defaults write com.apple.finder QLEnableXRayFolders -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Avoid creating .DS_Store files on USB volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Always open everything in Finder's list view
defaults write com.apple.finder FXPreferredViewStyle "Nlsv"
defaults write com.apple.finder FXPreferredSearchViewStyle "Nlsv"

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

defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock mineffect "scale"
defaults write com.apple.dock orientation "left"
defaults write com.apple.dock largesize -int 25
defaults write com.apple.dock tilesize -int 35
defaults write com.apple.dock "show-process-indicators" -bool true

# Do not group windows by application in Mission Control
defaults write com.apple.dock "expose-group-by-app" -bool false

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true


# Hot corners
# Bottom left screen corner → Mission Control
defaults write com.apple.dock wvous-bl-corner -int 2
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right screen corner → Start screen saver
defaults write com.apple.dock wvous-br-corner -int 10
defaults write com.apple.dock wvous-br-modifier -int 0
# Top left screen corner → Desktop
defaults write com.apple.dock wvous-tl-corner -int 4
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Notifications
defaults write com.apple.dock wvous-tr-corner -int 12
defaults write com.apple.dock wvous-tr-modifier -int 0


###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeDebugMenu -bool true
#defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
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
# Chrome
###############################################################################

# Disable swipe to go back or forward
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false


###############################################################################
# Address Book, Dashboard, iCal, iTunes, Mail, and Disk Utility               #
###############################################################################

defaults write com.apple.addressbook ABShowDebugMenu -bool true
defaults write com.apple.addressbook ABBirthDayVisible -bool true
defaults write com.apple.addressbook ABDefaultAddressCountryCode -string "us"
defaults write com.apple.addressbook ABNameDisplay -int 0
defaults write com.apple.addressbook ABNameSortingFormat -string "sortingFirstName sortingLastName"

# Enable the debug menu in iCal
defaults write com.apple.iCal IncludeDebugMenu -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Make arrows link to library instead of App Store
defaults write com.apple.iTunes invertStoreLinks -bool true
defaults write com.apple.iTunes show-store-link-arrows -bool false

# Make ⌘ + F focus the search input in iTunes
defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"

# Disable auto-playing when importing
defaults write com.apple.iTunes play-songs-while-importing -bool FALSE

# Disk Utility Debug Menu
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true

# Advanced Disk Utility mode
defaults write com.apple.diskcopy expert-mode -bool true


###############################################################################
# Terminal                                                                    #
###############################################################################

defaults write com.apple.terminal ShowTabBar -bool false

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4


###############################################################################
# Xcode                                                                       #
###############################################################################

defaults write com.apple.dt.Xcode AlwaysShowTabBar -bool false
defaults write com.apple.dt.Xcode AssistantEditorsLayout -bool false
defaults write com.apple.dt.Xcode DVTConvertExistingFilesLineEndings -bool true
defaults write com.apple.dt.Xcode DVTFindBarIgnoreCase -bool true
defaults write com.apple.dt.Xcode DVTTextAlignConsecutiveSlashSlashComments -bool true
defaults write com.apple.dt.Xcode DVTTextAutoSuggestCompletions -bool true
defaults write com.apple.dt.Xcode DVTTextEditorTrimWhitespaceOnlyLines -bool true
defaults write com.apple.dt.Xcode DVTTextIndentTabWidth -int 4
defaults write com.apple.dt.Xcode DVTTextIndentWidth -int 4
defaults write com.apple.dt.Xcode DVTTextPageGuideLocation -int 100
defaults write com.apple.dt.Xcode DVTTextShowFoldingSidebar -bool true
defaults write com.apple.dt.Xcode DVTTextShowLineNumbers -bool true
defaults write com.apple.dt.Xcode DVTTextShowPageGuide -bool true
defaults write com.apple.dt.Xcode IDEBuildOperationMaxNumberOfConcurrentCompileTasks `sysctl -n hw.ncpu`
defaults write com.apple.dt.Xcode IDECodeCompletionFuzzyMode 3
defaults write com.apple.dt.Xcode IDEDisableGitSupportForNewProjects -bool true
defaults write com.apple.dt.Xcode IDEDocViewerPreferredSDK "iphoneos"
defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES
defaults write com.apple.dt.Xcode ShowDVTDebugMenu -bool false

defaults write com.apple.dt.Xcode OMOpenInDashDisabled -bool false
defaults write com.apple.dt.Xcode OMOpenInDashStyle -int 2

defaults write com.apple.iphonesimulator SBFakeCarrier "Streeter"


###############################################################################
# Photos / Image Capture                                                      #
###############################################################################

# Never auto-launch photos or image capture for new devices
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true


###############################################################################
# Time Machine                                                                #
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true


###############################################################################
# Tweetbot
###############################################################################

defaults write com.tapbots.TweetbotMac ShowTheTweetbots -bool true
defaults write com.tapbots.TweetbotMac OpenURLsDirectly -bool true


###############################################################################
# Kill affected applications                                                  #
###############################################################################
for app in Finder Dock iCal Address\ Book SystemUIServer Twitter; do
    killall "$app" > /dev/null 2>&1;
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
