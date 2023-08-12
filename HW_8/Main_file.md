1. Вывести в консоль список всех пользователей системы.

al@al-VirtualBox:~$ cat /etc/passwd
````
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/run/ircd:/usr/sbin/nologin
_apt:x:42:65534::/nonexistent:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:998:998:systemd Network Management:/:/usr/sbin/nologin
systemd-timesync:x:997:997:systemd Time Synchronization:/:/usr/sbin/nologin
messagebus:x:100:106::/nonexistent:/usr/sbin/nologin
syslog:x:101:107::/nonexistent:/usr/sbin/nologin
systemd-resolve:x:996:996:systemd Resolver:/:/usr/sbin/nologin
uuidd:x:102:108::/run/uuidd:/usr/sbin/nologin
tss:x:103:110:TPM software stack,,,:/var/lib/tpm:/bin/false
systemd-oom:x:995:995:systemd Userspace OOM Killer:/:/usr/sbin/nologin
tcpdump:x:104:113::/nonexistent:/usr/sbin/nologin
avahi-autoipd:x:105:114:Avahi autoip daemon,,,:/var/lib/avahi-autoipd:/usr/sbin/nologin
usbmux:x:106:46:usbmux daemon,,,:/var/lib/usbmux:/usr/sbin/nologin
kernoops:x:107:65534:Kernel Oops Tracking Daemon,,,:/:/usr/sbin/nologin
whoopsie:x:108:115::/nonexistent:/bin/false
dnsmasq:x:109:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
avahi:x:110:116:Avahi mDNS daemon,,,:/run/avahi-daemon:/usr/sbin/nologin
cups-pk-helper:x:111:118:user for cups-pk-helper service,,,:/nonexistent:/usr/sbin/nologin
rtkit:x:112:119:RealtimeKit,,,:/proc:/usr/sbin/nologin
sssd:x:113:120:SSSD system user,,,:/var/lib/sss:/usr/sbin/nologin
speech-dispatcher:x:114:29:Speech Dispatcher,,,:/run/speech-dispatcher:/bin/false
fwupd-refresh:x:115:122:fwupd-refresh user,,,:/run/systemd:/usr/sbin/nologin
nm-openvpn:x:116:123:NetworkManager OpenVPN,,,:/var/lib/openvpn/chroot:/usr/sbin/nologin
saned:x:117:125::/var/lib/saned:/usr/sbin/nologin
colord:x:118:126:colord colour management daemon,,,:/var/lib/colord:/usr/sbin/nologin
geoclue:x:119:127::/var/lib/geoclue:/usr/sbin/nologin
gdm:x:120:128:Gnome Display Manager:/var/lib/gdm3:/bin/false
cups-browsed:x:121:118::/nonexistent:/usr/sbin/nologin
gnome-initial-setup:x:122:65534::/run/gnome-initial-setup/:/bin/false
hplip:x:123:7:HPLIP system user,,,:/run/hplip:/bin/false
al:x:1000:1000:Al77:/home/al:/bin/bash
user_with_group:x:1001:1001::/var/home/user:/bin/sh
user_with_group1:x:1002:1002::/var/home/user1:/bin/sh
user_with_group5:x:1003:1003::/var/home/uesr:/bin/sh
user_with_group7:x:1004:1005::/var/home/user:/bin/sh
_chrony:x:124:130:Chrony daemon,,,:/var/lib/chrony:/usr/sbin/nologin
user_with_group8:x:1005:1006::/home/user_with_group8:/bin/sh
user_with_group9:x:1006:1007::/home/user_with_group9:/bin/sh
user_with_group4:x:1007:1008::/home/user_with_group4:/bin/sh
sshd:x:125:65534::/run/sshd:/usr/sbin/nologin
````
2. Найти и вывести в консоль домашние каталоги для текущего пользователя и root.

al@al-VirtualBox:~$ sudo cat /etc/passwd |grep -e 'al:x' -e 'root:x'
````
root:x:0:0:root:/root:/bin/bash <<<<  /root
al:x:1000:1000:Al77:/home/al:/bin/bash <<< Домашняя директория /home/al
````
3. Создать Bash скрипт get-date.sh, выводящий текущую дату.

al@al-VirtualBox:~$ touch get-date.sh

al@al-VirtualBox:~$ chmod +x get-date.sh

al@al-VirtualBox:~$ sudo nano get-date.sh

al@al-VirtualBox:~$ ./get-date.sh 
````
Thu Aug 10 04:05:30 PM +03 2023
````
4. Запустить скрипт через ./get-date.sh и bash get-date.sh. Какой вариант не работает? Сделать так, чтобы оба варианта работали.

Оба варианта работают так как в сктипре указан какой интерпретатор сипользовать "#!/bin/bash"

5. Создать пользователей alice и bob с домашними директориями и установить /bin/bash в качестве командной оболочки по умолчанию.

al@al-VirtualBox:~$ sudo useradd -d /home/alice -m -s /bin/bash alice

al@al-VirtualBox:~$ sudo useradd -d /home/bob -m -s /bin/bash bob

al@al-VirtualBox:~$ cat /etc/passwd|grep -e'alice' -e'bob'
````
alice:x:1001:1001::/home/alice:/bin/bash
bob:x:1002:1002::/home/bob:/bin/bash
````
6. Запустить интерактивную сессию от пользователя alice. Создать файл secret.txt с каким-нибудь секретом в домашней директории при помощи текстового редактора nano.

al@al-VirtualBox:~$ sudo su alice

alice@al-VirtualBox:/home/al$ cd ~

alice@al-VirtualBox:~$ 

alice@al-VirtualBox:~$ nano secret.txt

7. Вывести права доступа к файлу secret.txt.

alice@al-VirtualBox:~$ ls -l
````
total 4
-rw-r--r-- 1 alice alice 0 Jul 20 12:38 h
-rw-r--r-- 1 alice alice 7 Aug 10 17:39 secret.txt
````
8. Выйти из сессии от alice и открыть сессию от bob. Вывести содержимое файла /home/alice/secret.txt созданного ранее не прибегая к команде sudo. В случае, если это не работает, объяснить.

alice@al-VirtualBox:~$ exit
````
exit
````
al@al-VirtualBox:~$ sudo su bob

bob@al-VirtualBox:/home/al$ cd ~

bob@al-VirtualBox:~$ cat /home/alice/secre.txt

cat: /home/alice/secre.txt: Permission denied

Пользователи bob и alica  находятся в разный группах и не имеют прав делать что либо с файлами из корневых каталогах друк друга.

9. Создать файл secret.txt с каким-нибудь секретом в каталоге /tmp при помощи текстового редактора nano.

bob@al-VirtualBox:/home/al$ cd /tmp

bob@al-VirtualBox:/tmp$ nano secret.txt

10. Вывести права доступа к файлу secret.txt. Поменять права таким образом, чтобы этот файл могли читать только владелец и члены группы, привязанной к файлу.

bob@al-VirtualBox:/tmp$ ls -l
````
total 52
srw-rw-rw- 1 root  root     0 Aug 10 16:00 dbus-naw6piVL
srw-rw-rw- 1 root  root     0 Aug 10 16:00 dbus-TWbFxc53
-rw-rw-r-- 1 bob bob    6 Aug 10 18:26 secret.txt
drwx------ 4 root  root  4096 Aug 10 16:06 snap-private-tmp
drwx------ 3 root  root  4096 Aug 10 16:00 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-chrony.service-UgNc5N
drwx------ 3 root  root  4096 Aug 10 16:01 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-colord.service-BdEyUU
drwx------ 3 root  root  4096 Aug 10 16:00 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-ModemManager.service-9I5x5n
drwx------ 3 root  root  4096 Aug 10 16:00 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-power-profiles-daemon.service-o10igb
drwx------ 3 root  root  4096 Aug 10 16:00 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-switcheroo-control.service-bRQR3s
drwx------ 3 root  root  4096 Aug 10 16:00 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-systemd-logind.service-s9yUbv
drwx------ 3 root  root  4096 Aug 10 16:00 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-systemd-oomd.service-GC7wxE
drwx------ 3 root  root  4096 Aug 10 16:00 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-systemd-resolved.service-QiGWsv
drwx------ 3 root  root  4096 Aug 10 16:01 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-upower.service-YjAdNx
drwx------ 2 al    al    4096 Aug 10 18:07 tracker-extract-3-files.1000
drwxrwxr-x 2 al    al    4096 Aug 10 16:02 ubuntu-advantage
````
bob@al-VirtualBox:/tmp$ chmod 640 secret.txt 

bob@al-VirtualBox:/tmp$ ls -l
````
total 52
srw-rw-rw- 1 root  root     0 Aug 10 16:00 dbus-naw6piVL
srw-rw-rw- 1 root  root     0 Aug 10 16:00 dbus-TWbFxc53
-rw-r----- 1 bob bob    6 Aug 10 18:26 secret.txt
drwx------ 4 root  root  4096 Aug 10 16:06 snap-private-tmp
drwx------ 3 root  root  4096 Aug 10 16:00 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-chrony.service-UgNc5N
drwx------ 3 root  root  4096 Aug 10 16:01 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-colord.service-BdEyUU
drwx------ 3 root  root  4096 Aug 10 16:00 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-ModemManager.service-9I5x5n
drwx------ 3 root  root  4096 Aug 10 16:00 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-power-profiles-daemon.service-o10igb
drwx------ 3 root  root  4096 Aug 10 16:00 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-switcheroo-control.service-bRQR3s
drwx------ 3 root  root  4096 Aug 10 16:00 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-systemd-logind.service-s9yUbv
drwx------ 3 root  root  4096 Aug 10 16:00 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-systemd-oomd.service-GC7wxE
drwx------ 3 root  root  4096 Aug 10 16:00 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-systemd-resolved.service-QiGWsv
drwx------ 3 root  root  4096 Aug 10 16:01 systemd-private-8b4b7a2e70f34a56a539ace42f5c6018-upower.service-YjAdNx
drwx------ 2 al    al    4096 Aug 10 18:07 tracker-extract-3-files.1000
drwxrwxr-x 2 al    al    4096 Aug 10 16:02 ubuntu-advantage
````
alice@al-VirtualBox:/tmp$ ls -l|grep secret
````
-rw-r----- 1 bob bob    6 Aug 10 18:26 secret.txt

````

11. Выйти из сессии от bob и открыть сессию от alice. Вывести содержимое файла /tmp/secret.txt созданного ранее не прибегая к команде sudo. В случае, если это не работает, объяснить.

alice@al-VirtualBox:/home/al$ cat /tmp/secret.txt 
````
cat: /tmp/secret.txt: Permission denied
````
alice@al-VirtualBox:/home/al$ ls -l /tmp|grep secret
````
-rw-r----- 1 bob  bob     6 Aug 11 11:12 secret.txt
````
Это связанно с тем ,что файл могут читать только владелец и группа ,а значить Bob  

12. Добавить пользователя alice в группу, привязанную к файлу /tmp/secret.txt.

al@al-VirtualBox:~$ sudo usermod -a -G bob alice


al@al-VirtualBox:~$ id alice
````
uid=1001(alice) gid=1001(alice) groups=1001(alice),1002(bob)
````
al@al-VirtualBox:~$ sudo su alice

13. Вывести содержимое файла /tmp/secret.txt.

alice@al-VirtualBox:/home/al$ cat /tmp/secret.txt 
````
hello

````
14. Скопировать домашнюю директорию пользователя alice в директорию /tmp/alice с помощью rsync.

al@al-VirtualBox:/home$ sudo rsync -a alice/ /tmp/alice

al@al-VirtualBox:/home$ ls -l /tmp |grep alice
````
drwxr-x--- 3 alice alice 4096 Aug 10 18:22 alice
````

15. Скопировать домашнюю директорию пользователя alice в директорию /tmp/alice на другую VM по SSH с помощью rsync. Как альтернатива, можно скопировать любую папку с хоста на VM по SSH.

al@al-VirtualBox:~$ sudo rsync -a /home/al/script al99999@172.21.78.202:~/script



16. Удалить пользователей alice и bob вместе с домашними директориями.

al@al-VirtualBox:~$ userdel -r alice

al@al-VirtualBox:~$ sudo userdel -r bob
````
userdel: bob mail spool (/var/mail/bob) not found
````
17

18

















