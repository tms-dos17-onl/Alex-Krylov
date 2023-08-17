#!/bin/bash

os=(linux Windows MacOC)
arch=(x32 x64 x86)
for i in ${!os[@]} ; do
echo
for an in ${!arch[@]} ; do

echo "${os[$i]}" - "${arch[$an]}"
done
done

