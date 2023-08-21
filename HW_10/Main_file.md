1. Создать Bash скрипт print-value.sh, выводящий значение переменной $VALUE в консоль. Выполнить скрипт 3 раза, передавая каждый раз значение этой переменной разным способом.

al@al-VirtualBox:~/script$ ./print-value.sh 
````
HW_10
HW_10
1
HW_10
````
2. Создать Shell скрипт check-parity-shell.sh, который принимает число в качестве первого аргумента командной строки, и для чётного числа выводит в консоль строку "чётное", а для нечётного - "нечётное". В случае, если переданный аргумент не является числом, вывести соответствующее сообщение и завершить скрипт с кодом 1.

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
3. Переписать скрипт из предыдущего задания на Bash и назвать его check-parity-oneline.sh таким образом, чтобы он не использовал конструкцию if ... then ... else .. fi.

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
4. Создать Bash скрипт not-empty-file.sh, который считывает из STDIN имя файла и выводит в STDOUT его имя в случае, если он не является пустым. Проверить работу файла при помощи команды ls | ./not-empty-file.sh | xargs wc -l.
   
al@al-VirtualBox:~/script$ ls check-parity-onlane.sh | ./not-empty-file.sh | xargs wc -l
````
7 ./not-empty-file.sh
````
5. Создать скрипт generate-testing-matrix.sh, в котором объявляется 2 массива (os - массив операционных систем и arch - массив архитектур процессора) и который выводит в консоль комбинации всех возможных пар <OS>-<ARCH>. Например, linux-x86, linux-amd64, и т.д.

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
6. Обновить файл .github/workflows/validate-shell.yaml, если он не совпадает с https://github.com/tms-dos17-onl/_sandbox/blob/main/.github/workflows/validate-shell.yaml.

Файл совподает ,но я делал git pull так, что он обновился в любом случае 

7. Создать Pull Request (PR) содержащий 5 созданных скриптов.


