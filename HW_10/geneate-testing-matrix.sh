#!/bin/bash
os=(linux Windows MacOC)
arch=(x32 x64 x86)
for i in "${!os[@]}"; do
	echo
	for an in "${!arch[@]}"; do

		echo "${os[$i]}" - "${arch[$an]}"
	done
done
#Этого не было в задании,просто хотел понять как сделать рандомную перемешку значений массива.
array=(1 2 3 4 5 6 7)
for i in "${array[@]}"; do
	mapfile -t shuffled_array < <(shuf -e "${array[@]}")
	echo "${shuffled_array[@]}"
done
