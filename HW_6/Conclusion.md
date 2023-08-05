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

Мне кажется я не доконца понял все, если что поправте.Я использую Curl как веб  браузер на серверной версии,перехожу на сайт который определяет мой публичный IP.

И с хоста и с VM, IP один, так как виртуалка создает локальный IP на базе моего который создан nat у моего провайдера, поэтомы все они используют его публичный IP для выхода в инет.

al@al-VirtualBox:~$ curl -v -L ifconfig.me
```
*   Trying 34.160.111.145:80...
* Connected to ifconfig.me (34.160.111.145) port 80 (#0)
> GET / HTTP/1.1
> Host: ifconfig.me
> User-Agent: curl/7.88.1
> Accept: */*
> 
< HTTP/1.1 200 OK
< access-control-allow-origin: *
< content-type: text/plain; charset=utf-8
< content-length: 12
< date: Sat, 05 Aug 2023 17:19:59 GMT
< x-envoy-upstream-service-time: 2
< strict-transport-security: max-age=2592000; includeSubDomains
< server: istio-envoy
< Via: 1.1 google
* Connection #0 to host ifconfig.me left intact
37.215.26.45
```
C:\Users\kullb>curl ifconfig.me
37.215.26.45


