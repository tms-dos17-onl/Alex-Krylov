#!/bin/bash
set -e 
read number

 case $number in
     ''|*[!0-9]*)
     echo not Num ;;
  *)
     [[ $(($number%2)) -eq 0 ]] && echo even || sleep 1
     [[ $(($number%2)) -ne 0 ]] && echo odd  || sleep 1
 ;;
  
  esac
 exit 1
