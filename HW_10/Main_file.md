1. Создать Bash скрипт print-value.sh, выводящий значение переменной $VALUE в консоль. Выполнить скрипт 3 раза, передавая каждый раз значение этой переменной разным способом.

al@al-VirtualBox:~/script$ ./print-value.sh 
````
HW_10
HW_10
1
HW_10
````
2
al@al-VirtualBox:~/script$ ./check-parity-shell.sh 
````
22
even
````
al@al-VirtualBox:~/script$ ./check-parity-shell.sh
````
11
odd
````
al@al-VirtualBox:~/script$ ./check-parity-shell.sh 
````
213sda
not Num
````
3
al@al-VirtualBox:~/script$ ./check-parity-onlane.sh 
````
22
even
````
al@al-VirtualBox:~/script$ ./check-parity-onlane.sh 
````
11
odd
````
al@al-VirtualBox:~/script$ ./check-parity-onlane.sh
````
asd12
not Num
````
4
al@al-VirtualBox:~/script$ ls check-parity-onlane.sh | ./not-empty-file.sh | xargs wc -l
````
7 ./not-empty-file.sh
````
5
