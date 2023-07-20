1.Смонтировать Home
al@al-VirtualBox:~$ lsblk
```
NAME            MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0             7:0    0    73M  1 loop /snap/core22/607
loop1             7:1    0     4K  1 loop /snap/bare/5
loop2             7:2    0 242.2M  1 loop /snap/firefox/2517
loop3             7:3    0 460.6M  1 loop /snap/gnome-42-2204/87
loop4             7:4    0  91.7M  1 loop /snap/gtk-common-themes/1535
loop5             7:5    0  12.3M  1 loop /snap/snap-store/959
loop6             7:6    0  53.2M  1 loop /snap/snapd/18933
loop7             7:7    0   452K  1 loop /snap/snapd-desktop-integration/83
sda               8:0    0    25G  0 disk 
├─sda1            8:1    0     1M  0 part 
├─sda2            8:2    0    20G  0 part /var/snap/firefox/common/host-hunspell
│                                         /
└─sda3            8:3    0     5G  0 part 

                253:0    0     3G  0 lvm  
sr0              11:0    1  1024M  0 rom 
```

Далее, что я делаю:Создаю PV,Затем VG и LV.Создаю директорию var/home. Монтирую в var/home.Переключаюсь в третий режим выполнения.Копирую файлы из Home в var/home.Удаляю все файлы из Home.Unmaunt var/home и монтирую в директорию Home ,WorHom-lvol0.Посде делаю чтоб монтирование совершалось при каждом запуске.Перезагружаю систему.

al@al-VirtualBox:~$ sudo pvcreate /dev/sda3
```
Physical volume "/dev/sdb" successfully created.
```
al@al-VirtualBox:~$ sudo vgcreate WorHom /dev/sda3
```
Volume group "WorHom" successfully created
```
al@al-VirtualBox:~$ sudo pvs
```
PV VG Fmt Attr PSize PFree
/dev/sda3 WorHom lvm2 a— 10.47g 10.47g
```
al@al-VirtualBox:~$ sudo lvcreate -L 3G WorHom
```
Logical volume "lvol0" created.
```
al@al-VirtualBox:~$ lsblk
```
NAME            MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0             7:0    0    73M  1 loop /snap/core22/607
loop1             7:1    0     4K  1 loop /snap/bare/5
loop2             7:2    0 242.2M  1 loop /snap/firefox/2517
loop3             7:3    0 460.6M  1 loop /snap/gnome-42-2204/87
loop4             7:4    0  91.7M  1 loop /snap/gtk-common-themes/1535
loop5             7:5    0  12.3M  1 loop /snap/snap-store/959
loop6             7:6    0  53.2M  1 loop /snap/snapd/18933
loop7             7:7    0   452K  1 loop /snap/snapd-desktop-integration/83
sda               8:0    0    25G  0 disk 
├─sda1            8:1    0     1M  0 part 
├─sda2            8:2    0    20G  0 part /var/snap/firefox/common/host-hunspell
│                                         /
└─sda3            8:3    0     5G  0 part 
  └─WorHom-lvol0
                253:0    0     3G  0 lvm  
sr0              11:0    1  1024M  0 rom  

```
al@al-VirtualBox:~$ sudo lvdisplay
```
—- Logical volume —-
LV Path /dev/HoWr/lvol0
LV Name lvol0
VG Name WorHom
LV UUID l1GxUI-VonN-d5UW-wA6n-QtH9-mZmG-OYoc2D
LV Write Access read/write
LV Creation host, time al@al-VirtualBox, 2023-07-13 18:26:02 +0300
LV Status available
# open 0
LV Size 5.00 GiB
Current LE 1280
Segments 1
Allocation inherit
Read ahead sectors auto
- currently set to 256
Block device 253:0
```
al@al-VirtualBox:~$ sudo mkfs.ext4 /dev/WorHom/lvol0
```
mke2fs 1.47.0 (5-Feb-2023)
Creating filesystem with 1310720 4k blocks and 327680 inodes
Filesystem UUID: 17a07f78-05d4-47c4-aacf-74a1efdac79b
Superblock backups stored on blocks:
32768, 98304, 163840, 229376, 294912, 819200, 884736

Allocating group tables: done
Writing inode tables: done
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done
```

al@al-VirtualBox:~$ sudo mount /dev/WorHom/lvol0 /var/Home

al@al-VirtualBox:~$ lsblk
```
NAME            MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0             7:0    0    73M  1 loop /snap/core22/607
loop1             7:1    0     4K  1 loop /snap/bare/5
loop2             7:2    0 242.2M  1 loop /snap/firefox/2517
loop3             7:3    0 460.6M  1 loop /snap/gnome-42-2204/87
loop4             7:4    0  91.7M  1 loop /snap/gtk-common-themes/1535
loop5             7:5    0  12.3M  1 loop /snap/snap-store/959
loop6             7:6    0  53.2M  1 loop /snap/snapd/18933
loop7             7:7    0   452K  1 loop /snap/snapd-desktop-integration/83
sda               8:0    0    25G  0 disk 
├─sda1            8:1    0     1M  0 part 
├─sda2            8:2    0    20G  0 part /var/snap/firefox/common/host-hunspell
│                                         /
└─sda3            8:3    0     5G  0 part 
  └─WorHom-lvol0
                253:0    0     3G  0 lvm /var/Home 
sr0              11:0    1  1024M  0 rom  
```
al@al-VirtualBox:~$ sudo telinit 3

al@al-VirtualBox:~$ sudo cp -a /home/* /var/Home

al@al-VirtualBox:~$ sudo rm -rf /home/*

al@al-VirtualBox:~$ sudo umount /var/Home

al@al-VirtualBox:~$ sudo mount /dev/WorHom/lvol0 /home 

al@al-VirtualBox:~$ sudo nano /etc/fstab
```
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/sda2 during curtin installation
/dev/disk/by-uuid/871d6ab0-bd32-43fc-bb46-8fd939101bb4 / ext4 defaults 0 1
/swap.img       none    swap    sw      0       0
/dev/WorHom/lvol0 /home ext4 relatime 0 2

```
al@al-VirtualBox:~$ reboot

2.Создать Пользователя .....

al@al-VirtualBox:~$ sudo useradd -m user_with_group7 \\\ Создали с домайшней дирекрорией

al@al-VirtualBox:~$ sudo usermod -md /var/home/user user_with_group7\\\ Изменил дом директориию.Как я понял, эта команда должна переносить все в новую дирекроию, но уменя она этого не делает. 

al@al-VirtualBox:~$ cat /etc/passwd
```
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
user_with_group7:x:1004:1005::/var/home/user:/bin/sh /// Вот он
```
3.Создание группы ....
al@al-VirtualBox:~$ sudo groupadd HomeWork

al@al-VirtualBox:~$ sudo usermod -aG HomeWork user_with_group7

al@al-VirtualBox:~$ id user_with_group7
```
uid=1004(user_with_group7) gid=1005(user_with_group7) groups=1005(user_with_group7),1004(HomeWork)
al@al-VirtualBox:~$
```
4.Выдать права ....

al@al-VirtualBox:/home$ sudo mkdir Class 

al@al-VirtualBox:/home$ ls -l
```
total 32
drwxr-x--- 15 al               al                4096 Jul 19 18:49 al
drwxr-xr-x  2 root             root              4096 Jul 20 15:44 Class
-rw-r--r--  1 root             root                 0 Jul 20 11:52 h
drwx------  2 root             root             16384 Jul 19 18:43 lost+found
drwxr-x---  2 user_with_group  user_with_group   4096 Jul 20 11:52 user_with_group
drwxr-x---  2 user_with_group1 user_with_group1  4096 Jul 20 12:39 user_with_group1
```
l@al-VirtualBox:/home$ sudo chgrp HomeWork Class

al@al-VirtualBox:/home$ ls -l
```
total 32
drwxr-x--- 15 al               al                4096 Jul 19 18:49 al
drwxr-xr-x  2 root             HomeWork          4096 Jul 20 15:44 Class
-rw-r--r--  1 root             root                 0 Jul 20 11:52 h
drwx------  2 root             root             16384 Jul 19 18:43 lost+found
drwxr-x---  2 user_with_group  user_with_group   4096 Jul 20 11:52 user_with_group
drwxr-x---  2 user_with_group1 user_with_group1  4096 Jul 20 12:39 user_with_group1
```
al@al-VirtualBox:/home$ sudo chmod 070 Class

al@al-VirtualBox:/home$ ls -l
```
total 32
drwxr-x--- 15 al               al                4096 Jul 19 18:49 al
d---rwx---  2 root             HomeWork          4096 Jul 20 15:44 Class
-rw-r--r--  1 root             root                 0 Jul 20 11:52 h
drwx------  2 root             root             16384 Jul 19 18:43 lost+found
drwxr-x---  2 user_with_group  user_with_group   4096 Jul 20 11:52 user_with_group
drwxr-x---  2 user_with_group1 user_with_group1  4096 Jul 20 12:39 user_with_group1
```

