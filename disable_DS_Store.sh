#!/usr/bin/env sh

printf '%s' 'Disabling creation of .DS_Store on network drives... '
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
if (( $? ))
then
	printf '%s\n' 'Failed.'
else
	printf '%s\n' 'Success.'
fi

printf '%s' 'Disabling creation of .DS_Store on removable drives... '
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

if (( $? ))
then
	printf '%s\n' 'Failed.'
else
	printf '%s\n' 'Success.'
fi
