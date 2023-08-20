#!/bin/bash
echo $VALUE
x=$VALUE
echo $x
read number

[[ $number -le 2 ]] && echo $x || echo not VALUE
