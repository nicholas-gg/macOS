#!/usr/bin/env sh

_USAGE()
{
	printf '%s\n' '' "Usage: $0 <size>"
	printf '%s\n' 'Size is in gigabytes and can be 1, 2, 4, 8 and 16.' ''
	exit 1
}

if [ $2 ]
then
	printf '%s\n' '' 'Too many parameters!'
	_USAGE
fi

if [ -e $1 ]
then
	printf '%s\n' '' 'Not enough parameters!'
	_USAGE
fi

case "$1" in

1)	SIZE="2097152"
	;;
2)	SIZE="4194304"
	;;
4)	SIZE="8388608"
	;;
8)	SIZE="16777216"
	;;
16)	SIZE="33554432"
	;;
*)	printf '%s\n' '' 'Unsupported size.'
	_USAGE
	;;
esac

printf '%s\n' '' "Creating $1 GB RAM disk:"
/usr/sbin/diskutil erasevolume APFSX 'ramdisk' `/usr/bin/hdiutil attach -nomount ram://$SIZE`
printf '%s\n' ''

exit 0
