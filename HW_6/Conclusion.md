1. Определить все IP адреса, маски подсетей и соответствующие MAC адреса Linux VM. Определите класс и адреса

al@al-VirtualBox:~$ ip a
```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:60:de:a4 brd ff:ff:ff:ff:ff:ff
    inet 172.28.216.192/20 brd 172.28.223.255 scope global dynamic noprefixroute enp0s3
       valid_lft 86313sec preferred_lft 86313sec
    inet6 fe80::ba17:35ab:636:8e5c/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever

```
