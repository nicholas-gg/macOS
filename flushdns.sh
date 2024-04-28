#!/usr/bin/env sh

/usr/bin/dscacheutil -flushcache
/usr/bin/killall -HUP mDNSResponder
