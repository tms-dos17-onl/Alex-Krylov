1. Установить Nginx и смонтировать в него:
- конфигурационный файл с хоста, который выполняет настройку HTTPS для страницы по умолчанию
- директорию с сертификатами

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/556d0605-b5e4-47df-b938-a9c139d3d75e)

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/9cdf8219-93b0-4352-8981-34211d678d81)

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/7db686c3-e23a-4825-895d-3ea7d4d54aa8)

2. Запустить 2 Docker контейнера (например, Docker Getting Started и netshoot) с настройками сети по умолчанию и проверить есть ли между ними соединение.

alex77@DESKTOP-DF0R6BK:~$ docker ps
````
CONTAINER ID   IMAGE                    COMMAND                  CREATED         STATUS         PORTS                NAMES
30185d033fcd   nicolaka/netshoot        "zsh"                    2 minutes ago   Up 2 minutes                        elated_montalcini
70c330c7b7c0   docker/getting-started   "/docker-entrypoint.…"   9 minutes ago   Up 9 minutes   0.0.0.0:80->80/tcp   epic_wescoff
````
alex77@DESKTOP-DF0R6BK:~$ docker inspect 70c330c7b7c0
````
 "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "NetworkID": "6aa7444d07a99226d521506857793077f7905fe86687c458d7dbfc924dbe840a",
                    "EndpointID": "d90f139d83584f50ff67c44775c61dc7f8d6a6b24ff7bc256289f558aed4e8f8",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.2",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:11:00:02",
                    "DriverOpts": null
````

alex77@DESKTOP-DF0R6BK:~$ docker run -it --net host nicolaka/netshoot
````
                    dP            dP                           dP
                    88            88                           88
88d888b. .d8888b. d8888P .d8888b. 88d888b. .d8888b. .d8888b. d8888P
88'  `88 88ooood8   88   Y8ooooo. 88'  `88 88'  `88 88'  `88   88
88    88 88.  ...   88         88 88    88 88.  .88 88.  .88   88
dP    dP `88888P'   dP   `88888P' dP    dP `88888P' `88888P'   dP

Welcome to Netshoot! (github.com/nicolaka/netshoot)
Version: 0.11
````
 docker-desktop  ~  hostname -i
 ````
192.168.65.4
````
 docker-desktop  ~  ping 172.17.0.2
 ````
PING 172.17.0.2 (172.17.0.2) 56(84) bytes of data.
64 bytes from 172.17.0.2: icmp_seq=1 ttl=64 time=0.058 ms
64 bytes from 172.17.0.2: icmp_seq=2 ttl=64 time=0.076 ms
64 bytes from 172.17.0.2: icmp_seq=3 ttl=64 time=0.053 ms
64 bytes from 172.17.0.2: icmp_seq=4 ttl=64 time=0.037 ms
64 bytes from 172.17.0.2: icmp_seq=5 ttl=64 time=0.073 ms
64 bytes from 172.17.0.2: icmp_seq=6 ttl=64 time=0.046 ms
^C
--- 172.17.0.2 ping statistics ---
6 packets transmitted, 6 received, 0% packet loss, time 5204ms
rtt min/avg/max/mdev = 0.037/0.057/0.076/0.013 ms
````
3

alex77@DESKTOP-DF0R6BK:~$ docker volume create Hw_MarDB
````
Hw_MarDB
````
alex77@DESKTOP-DF0R6BK:~$ docker volume ls
````
DRIVER    VOLUME NAME
local     Hw_MarDB
````
alex77@DESKTOP-DF0R6BK:~$ docker volume inspect Hw_MarDB
````
[
    {
        "CreatedAt": "2023-10-02T12:42:45Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/Hw_MarDB/_data",
        "Name": "Hw_MarDB",
        "Options": null,
        "Scope": "local"
    }
]
````
alex77@DESKTOP-DF0R6BK:~$ docker run -d --name mariadb1 -e MYSQL_ROOT_PASSWORD=1234567 -v Hw_MarDB:/var/lib/mysql mariadb:11.0
````
Unable to find image 'mariadb:11.0' locally
11.0: Pulling from library/mariadb
44ba2882f8eb: Pull complete
08b8223d0cb6: Pull complete
ef2696fb09d6: Pull complete
6ae32c298a0d: Pull complete
737007b25ac8: Pull complete
0dbe827889a7: Pull complete
c66389b6a4b9: Pull complete
a0724dc11b95: Pull complete
Digest: sha256:e3f4b8528cd0e11024d33873a842f6e8818dcaace49a19970bea91299048594f
Status: Downloaded newer image for mariadb:11.0
89b8b7695e4a1ed246f1022d8a37c7f0f2b1fd2a47d53878687e3c180523b2be
````
- Запустить интерактивную сессию Bash в запущенном контейнере при помощи docker exec
alex77@DESKTOP-DF0R6BK:~$ docker exec -it mariadb1 bash

root@89b8b7695e4a:/# mariadb -u root -p
````
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 3
Server version: 11.0.3-MariaDB-1:11.0.3+maria~ubu2204 mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
````
- Проверить версию MariaDB через SQL запрос.

MariaDB [(none)]> select version();
````
+---------------------------------------+
| version()                             |
+---------------------------------------+
| 11.0.3-MariaDB-1:11.0.3+maria~ubu2204 |
+---------------------------------------+
1 row in set (0.000 sec)
````
- Создать БД, таблицу и запись.
- 
MariaDB [lol]> SELECT * FROM homework;
````
+----+--------+------+------------+
| id | people | name | date       |
+----+--------+------+------------+
|  1 | man    | bob  | 2023-07-15 |
+----+--------+------+------------+
1 row in set (0.048 sec)
````
- Выполнить апгрейд MariaDB путем подмены версии используемого Docker образа на 11.1.2.

docker run -d --name mariadb1 -e MYSQL_ROOT_PASSWORD=1234567 -v Hw_MarDB:/var/lib/mysql mariadb:11.1.2 

- Проверить, что версия MariaDB поменялась.

alex77@DESKTOP-DF0R6BK:~$ docker ps
````
CONTAINER ID   IMAGE            COMMAND                  CREATED         STATUS         PORTS      NAMES
6a9563625515   mariadb:11.1.2   "docker-entrypoint.s…"   3 minutes ago   Up 3 minutes   3306/tcp   mariadb1
````

- Проверить, что данные остались.

alex77@DESKTOP-DF0R6BK:~$ docker exec -it mariadb1 bash

root@38be863b7e17:/# mariadb -u root -p
Enter password:
````
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 3
Server version: 11.1.2-MariaDB-1:11.1.2+maria~ubu2204 mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
````
MariaDB [(none)]> use lol;
````
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
````
MariaDB [lol]> SELECT * FROM homework;
````
+----+--------+------+------------+
| id | people | name | date       |
+----+--------+------+------------+
|  1 | man    | bob  | 2023-07-15 |
+----+--------+------+------------+
1 row in set (0.019 sec)
````
