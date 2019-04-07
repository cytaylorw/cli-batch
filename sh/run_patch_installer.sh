#!/bin/bash
#
# Run patch installer by Taylor Wong
# Please keep the patch file and this script in the same directory

[ "$#" -ne 1 ] && echo "Require (only) 1 paramter. For example: sh $0 patch.sfs" && exit 1
[ ! -e "$1" ]&& echo "'$1' does not exit." && exit 2
if ! [[ "$1" =~ \.sfs$ ]]; then
	echo "The parameter should be a .sfs file."
	exit 3
fi

mkdir /media/patch
mount -o loop -t squashfs $1 /media/patch
/media/patch/installer

