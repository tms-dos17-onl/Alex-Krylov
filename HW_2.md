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


