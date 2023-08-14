#!/bin/sh
read number

if [ $number =~ ^[0-9]+$ ]  && [ $(($number%2)) -eq 0 ] ; then
echo 'even'

elif [ $number =~ ^[0-9]+$ ] && [ $(($number%2)) -ne 0 ] ; then
 echo 'odd'
 else
 echo not Num

 exit 1
 
fi

#!/bin/bash
set -e 
read number

 case $number in
     ''|*[0-9]*)
     if [ $(($number%2)) -eq 0 ] ; then
echo even 

elif [ $(($number%2)) -ne 0 ] ; then
echo odd 
fi
;;

  *)
  echo not Num ;;
  
  esac
 
