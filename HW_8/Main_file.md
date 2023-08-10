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
2
al@al-VirtualBox:~$ sudo cat /etc/passwd |grep -e 'al:x' -e 'root:x'
````
root:x:0:0:root:/root:/bin/bash <<<<  /root
al:x:1000:1000:Al77:/home/al:/bin/bash <<< Домашняя директория /home/al
````
3

al@al-VirtualBox:~$ touch get-date.sh

al@al-VirtualBox:~$ chmod +x get-date.sh

al@al-VirtualBox:~$ sudo nano get-date.sh

al@al-VirtualBox:~$ ./get-date.sh 
````
Thu Aug 10 04:05:30 PM +03 2023
````
4
Оба варианта работают так как в сктипре указан какой интерпретатор сипользовать "#!/bin/bash"

5

al@al-VirtualBox:~$ sudo useradd -d /home/alice -m -s /bin/bash alice

al@al-VirtualBox:~$ sudo useradd -d /home/bob -m -s /bin/bash bob

al@al-VirtualBox:~$ cat /etc/passwd|grep -e'alice' -e'bob'
````
alice:x:1001:1001::/home/alice:/bin/bash
bob:x:1002:1002::/home/bob:/bin/bash
````








