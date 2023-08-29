#!/bin/bash

set -e
read -r number

case $number in
'' | *[!0-9]*)
	echo not Num
	;;
*)
	[[ $((number % 2)) -eq 0 ]] && echo even || echo odd
	;;

esac
