#!/usr/bin/env bash

# Prepare GitHub runner

# Change Local name to avoid name clash causing alert
suffix=$RANDOM
UniqueComputerName="$GITHUB_WORKFLOW-$suffix"
sudo scutil --set LocalHostName "$UniqueComputerName"
sudo scutil --set ComputerName "$UniqueComputerName"

# Close Notification window
killall UserNotificationCenter || true

# Do not disturb
defaults -currentHost write com.apple.notificationcenterui doNotDisturb -boolean true
defaults -currentHost write com.apple.notificationcenterui doNotDisturbDate -date "`date -u +\"%Y-%m-%d %H:%M:%S +0000\"`"
killall NotificationCenter

# Disable firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw -k

# Close Finder Windows using Apple Script
sudo osascript -e 'tell application "Finder" to close windows'
