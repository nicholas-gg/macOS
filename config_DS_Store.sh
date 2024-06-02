#!/usr/bin/env sh

_STATUS() {
  printf '%s\n' "Writing .DS_Store on $1 drives is currently $2."
}

printf '%s' 'Reading configuration... '

_NWSTATUS=$(defaults read com.apple.desktopservices DSDontWriteNetworkStores 2>/dev/null)
if [ "$_NWSTATUS" = "true" ]; then
	_NWSTATUS=disabled
elif [ "$_NWSTATUS" = "false" ]; then
	_NWSTATUS=enabled
elif [ -z "$_NWSTATUS" ]; then
	_NWSTATUS='not configured (enabled)'
else
	_NWSTATUS=misconfigured
fi

_USBSTATUS=$(defaults read com.apple.desktopservices DSDontWriteUSBStores 2>/dev/null)
if [ "$_USBSTATUS" = "0" ]; then
	_USBSTATUS=enabled
elif [ "$_USBSTATUS" = "1" ]; then
	_USBSTATUS=disabled
elif [ -z "$_USBSTATUS" ]; then
	_USBSTATUS='not configured (enabled)'
else
	_USBSTATUS=misconfigured
fi

printf '%s\n' 'done.' ''

_STATUS network "$_NWSTATUS"
_STATUS removable "$_USBSTATUS"

