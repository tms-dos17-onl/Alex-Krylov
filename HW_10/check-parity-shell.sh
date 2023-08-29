#!/bin/sh
set -e
read -r number

case $number in
'' | *[!0-9]*)
	echo not Num
	;;
*)
	if [ $((number % 2)) -eq 0 ]; then
		echo even

	elif [ $((number % 2)) -ne 0 ]; then
		echo odd
	fi
	;;
esac
