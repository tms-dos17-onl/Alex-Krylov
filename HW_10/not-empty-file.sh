#!/bin/bash
read -r file
if [[ -f $file ]] && [[ -s $file ]]; then
	echo "$0"

fi
