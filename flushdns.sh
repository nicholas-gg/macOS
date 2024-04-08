#!/bin/zsh

/usr/bin/dscacheutil -flushcache
/usr/bin/killall -HUP mDNSResponder
