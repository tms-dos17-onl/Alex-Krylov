#!/bin/bash
os=(linux Windows MacOC)
arch=(x32 x64 x86)
for i in "${!os[@]}"; do
	echo
	for an in "${!arch[@]}"; do

		echo "${os[$i]}" - "${arch[$an]}"
	done 
done 
array=(1 2 3 4 5 6 7)
for i in "${array[@]}"; do

	echo $(shuf -e "${array[@]}") #Этого не было в задании,просто хотел понять как сделать рандомную перемешку значений массива.
done
