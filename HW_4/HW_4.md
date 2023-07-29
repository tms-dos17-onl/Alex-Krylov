1.....
al@al-VirtualBox:~/script$ ps
```
    PID TTY          TIME CMD
   2352 pts/0    00:00:00 bash
   3981 pts/0    00:00:00 ps
```
2....
al@al-VirtualBox:~/script$ touch script_4.sh /// Создаем файл

al@al-VirtualBox:~/script$ chmod +x script_4.sh////Даем исполнение.Далее пишел скрипт


al@al-VirtualBox:~/script/script_4.sh & ////Запускаем скрипт в фоновом режиме
[1] 2775
3....

Убедиться легко,ведь файл постоянно растет в азмере или через Cat

4......
al@al-VirtualBox:~/script$ jobs ////Проверяем
```
[1]+  Running                 ~/script/script_4.sh &
```
al@al-VirtualBox:~/script$ kill %1 /////Прекращаю работу

al@al-VirtualBox:~/script$ jobs
```
[1]+  Terminated              ~/script/script_4.sh
```
5......
al@al-VirtualBox:~/script$ sudo nano /etc/sustemd/system/HWork.service /////Добавляю автозагрузку

```
[Unit]
Description=HWORK

[Service]
ExecStart=/home/al/script/script_4.sh

[Install]
WantedBy=default.target
```
al@al-VirtualBox:/etc/systemd/system$ sudo systemctl start Hwork.service

al@al-VirtualBox:/etc/systemd/system$ sudo systemctl status Hwork.service
```
○ Hwork.service - HWORK
     Loaded: loaded (/etc/systemd/system/Hwork.service; disabled; preset: enabled)
     Active: inactive (dead)
```
al@al-VirtualBox:/etc/systemd/system$ sudo systemctl enable Hwork.service
```
Created symlink /etc/systemd/system/default.target.wants/Hwork.service → /etc/systemd/system/Hwork.service.
```
al@al-VirtualBox:/etc/systemd/system$ sudo systemctl status Hwork.service
```
○ Hwork.service - HWORK
     Loaded: loaded (/etc/systemd/system/Hwork.service; enabled; preset: enabled)
     Active: inactive (dead)

```
Перезагружаем и все работает.

6......

Я может не правильно понял задание.Но вроде, это и есть логи моего сервиса.

al@al-VirtualBox:~$ cat /var/log/syslog |grep Hwork

```
2023-07-27T18:04:05.544962+03:00 al-VirtualBox systemd[1]: Started Hwork.service - HWORK.
2023-07-27T18:04:05.568001+03:00 al-VirtualBox systemd[1]: Hwork.service: Deactivated successfully.
2023-07-27T18:20:03.548719+03:00 al-VirtualBox systemd[1]: Started Hwork.service - HWORK.
2023-07-27T18:20:03.548832+03:00 al-VirtualBox systemd[1]: Hwork.service: Deactivated successfully.
```








  


