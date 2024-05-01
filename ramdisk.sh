#!/usr/bin/env sh

if [ $2 ]
then
	echo "Usage: ramdisk [ size ]"
	echo "Size is in gigabytes and can be 1, 2, 4, 6 and 8."
	echo "The default is 2."
	exit
fi

if [ -e $1 ]
then
	echo "Using default value of 2 GB."
	echo "Creating 2 GB RAM disk:"
	SIZE="4194304"
	/usr/sbin/diskutil erasevolume HFS+ 'ramdisk' `/usr/bin/hdiutil attach -nomount ram://$SIZE`
	exit
fi

case "$1" in

1)	echo "Creating $1 GB RAM disk:"
	SIZE="2097152"
	;;
2)	echo "Creating $1 GB RAM disk:"
	SIZE="4194304"
	;;
4)	echo "Creating $1 GB RAM disk:"
	SIZE="8388608"
	;;
6)	echo "Creating $1 GB RAM disk:"
	SIZE="12582912"
	;;
8)	echo "Creating $1 GB RAM disk:"
	SIZE="16777216"
	;;
*)	echo "Wrong size."
	echo "Size is in gigabytes and can be 1, 2, 4, 6 and 8."
	echo "The default is 2."
	;;
esac

/usr/sbin/diskutil erasevolume APFSX 'ramdisk' `/usr/bin/hdiutil attach -nomount ram://$SIZE`

exit 0
