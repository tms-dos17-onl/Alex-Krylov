#!/bin/bash

os=(linux Windows MacOC)
arch=(x32 x64 x86)
for i in ${!os[@]} ; do
echo
for an in ${!arch[@]} ; do

echo "${os[$i]}" - "${arch[$an]}"
done
done
---------------------------------
array=(1 2 3 4 5 6 7)
for i in $[$RANDOM % ${#array[@]}] ; do

echo ${array[$i]}
done
