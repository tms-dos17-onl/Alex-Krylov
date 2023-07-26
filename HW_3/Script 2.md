#!/bin/bash
sudo useradd -m user_with_group4
sudo touch user_with_group4 h
sudo chmod 777 /home/user_with_group4/h
sudo chmod 777 /home/user_with_group4
sudo lshw -class processor >> /home/user_with_group4/h |echo ----- >> /home/user_with_group4/h 
sudo free >> /home/user_with_group4/h |echo ------ >> /home/user_with_group4/h
sudo ls -l /boot >> /home/user_with_group4/h|echo ----- >> /home/user_with_group4/h
sudo lsblk >> /home/user_with_group4/h |echo ------- >> /home/user_with_group4/h
Вывод.

al@al-VirtualBox:/home$ sudo cat /home/user_with_group4/h
```
  *-cpu
       product: Intel(R) Core(TM) i5-9600KF CPU @ 3.70GHz
       vendor: Intel Corp.
       physical id: 2
       bus info: cpu@0
       version: 6.158.13
       width: 64 bits
       capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx rdtscp x86-64 constant_tsc rep_good nopl xtopology nonstop_tsc cpuid tsc_known_freq pni pclmulqdq ssse3 cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single fsgsbase bmi1 avx2 bmi2 invpcid rdseed clflushopt md_clear flush_l1d arch_capabilities
------
               total        used        free      shared  buff/cache   available
Mem:         4000412     1367008     1956840       53960      953220     2633404
Swap:        3487740           0     3487740
-----
total 202212
-rw-r--r-- 1 root root   276283 Apr  6 09:33 config-6.2.0-20-generic
-rw-r--r-- 1 root root   275920 Jun 16 16:22 config-6.2.0-25-generic
drwxr-xr-x 5 root root     4096 Jul 19 18:05 grub
lrwxrwxrwx 1 root root       27 Jul 19 17:46 initrd.img -> initrd.img-6.2.0-25-generic
-rw-r--r-- 1 root root 77044746 Jul 19 18:03 initrd.img-6.2.0-20-generic
-rw-r--r-- 1 root root 84193606 Jul 19 18:24 initrd.img-6.2.0-25-generic
lrwxrwxrwx 1 root root       27 Apr 18 23:34 initrd.img.old -> initrd.img-6.2.0-20-generic
-rw-r--r-- 1 root root   138712 Feb 11 13:16 memtest86+ia32.bin
-rw-r--r-- 1 root root   139776 Feb 11 13:16 memtest86+ia32.efi
-rw-r--r-- 1 root root   144312 Feb 11 13:16 memtest86+x64.bin
-rw-r--r-- 1 root root   145408 Feb 11 13:16 memtest86+x64.efi
-rw------- 1 root root  8146863 Apr  6 09:33 System.map-6.2.0-20-generic
-rw------- 1 root root  8163660 Jun 16 16:22 System.map-6.2.0-25-generic
lrwxrwxrwx 1 root root       24 Jul 19 17:46 vmlinuz -> vmlinuz-6.2.0-25-generic
-rw------- 1 root root 14524456 Apr  6 09:35 vmlinuz-6.2.0-20-generic
-rw------- 1 root root 13854600 Jun 16 18:47 vmlinuz-6.2.0-25-generic
lrwxrwxrwx 1 root root       24 Apr 18 23:34 vmlinuz.old -> vmlinuz-6.2.0-20-generic
-------
NAME             MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0              7:0    0  73.9M  1 loop /snap/core22/817
loop1              7:1    0     4K  1 loop /snap/bare/5
loop2              7:2    0    73M  1 loop /snap/core22/607
loop3              7:3    0 242.2M  1 loop /snap/firefox/2517
loop4              7:4    0 485.5M  1 loop /snap/gnome-42-2204/120
loop5              7:5    0 460.6M  1 loop /snap/gnome-42-2204/87
loop6              7:6    0  91.7M  1 loop /snap/gtk-common-themes/1535
loop7              7:7    0  12.3M  1 loop /snap/snap-store/959
loop8              7:8    0  53.2M  1 loop /snap/snapd/18933
loop9              7:9    0   452K  1 loop /snap/snapd-desktop-integration/83
loop10             7:10   0  53.3M  1 loop /snap/snapd/19457
sda                8:0    0    25G  0 disk 
├─sda1             8:1    0     1M  0 part 
├─sda2             8:2    0    20G  0 part /var/snap/firefox/common/host-hunspell
│                                          /
└─sda3             8:3    0     5G  0 part 
  └─WorHom-lvol0 253:0    0     3G  0 lvm  /home
sr0               11:0    1  1024M  0 rom  
```
````
