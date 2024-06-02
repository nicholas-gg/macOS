#!/usr/bin/env sh

printf '%s' 'Disabling creation of .DS_Store on network drives... '
if defaults write com.apple.desktopservices DSDontWriteNetworkStores true; then
	printf '%s\n' 'Success.'
else
	printf '%s\n' 'Failed.'
fi

printf '%s' 'Disabling creation of .DS_Store on removable drives... '
if defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true; then
	printf '%s\n' 'Success.'
else
	printf '%s\n' 'Failed.'
fi
