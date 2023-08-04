1. Определить все IP адреса, маски подсетей и соответствующие MAC адреса Linux VM. Определите класс и адреса подсетей, в которых находится VM.

al@al-VirtualBox:~$ ifconfig
```
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.28.216.192  netmask 255.255.240.0  broadcast 172.28.223.255
        inet6 fe80::ba17:35ab:636:8e5c  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:60:de:a4  txqueuelen 1000  (Ethernet)
        RX packets 3993  bytes 4074844 (4.0 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2737  bytes 407775 (407.7 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 445  bytes 51794 (51.7 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 445  bytes 51794 (51.7 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```
Класс сети В( от 128 до 198) 

Адресс сети 192.28.208.0

IP адресс первого хоста 192.28.208.1

IP адресс last 192.28.223.254 

2. Определить публичный IP адрес хоста и Linux VM? Чем они отличаются?

