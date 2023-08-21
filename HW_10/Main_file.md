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
al@al-VirtualBox:~/script$ ./generate-testing-matrix.sh 
````
linux - x32
linux - x64
linux - x86

Windows - x32
Windows - x64
Windows - x86

MacOC - x32
MacOC - x64
MacOC - x86
./generate-testing-matrix.sh: line 12: --------------------------: command not found
5 7 4 6 3 1 2
7 5 3 1 4 2 6
3 6 1 2 4 5 7
3 2 7 6 4 5 1
4 6 2 5 7 1 3
3 6 7 2 5 1 4
4 6 3 1 5 7 2
````
6

7
