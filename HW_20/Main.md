1. Написать Dockerfile для React приложения. Можно сгенерировать ресурсы для веб-сайта прямо из исходников, а можно уже взять готовые из папки build. Собрать образ, запустить и проверить работоспособность приложения в контейнере.

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/a68e3f8e-43ff-434a-b075-fb95e54d7ec0)

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/a0aafb8d-5d34-4076-9016-0c5c46363a8e)

2. Написать Dockerfile для LAMP приложения, который устанавливает весь LAMP стек в один образ. Подсказка: для того, чтобы в Docker контейнере запускались службы, нужно установить systemd и задать его как ENTRYPOINT, а также запускать контейнер в привилегированном режиме. Например, как тут.

- Dockerfile
````
FROM ubuntu:23.04

RUN apt-get update && apt-get install -y \
 apache2 \
 mysql-server \
 php \
 libapache2-mod-php \
 php-mysql \
 python3-mysqldb \ 
 systemd \
 curl \
 unzip \
 wget \
 iproute2 \
 && mkdir /home/hw_20 \
 && wget -O /home/hw_20/master.zip https://github.com/qyjohn/simple-lamp/archive/refs/heads/master.zip \
 && unzip /home/hw_20/master.zip -d /var/www/html
 RUN service mysql start \
 && mysql -u root -p1234  -e \
 "CREATE DATABASE simple_lamp; CREATE USER 'new'@'localhost' IDENTIFIED BY '1234'; \
 GRANT ALL PRIVILEGES ON simple_lamp.* TO 'new'@'localhost'; \
 use simple_lamp; source /var/www/html/simple-lamp-master/simple_lamp.sql;" \
 && sed -i -e 's/$db_username = "username";/$db_username = "new";/' \
 -e 's/$db_password = "password";/$db_password = "1234";/' -e \
 's/$cache_server = "dns-or-ip-of-memcached-server";/$cache_server = "localhost";/' \
 /var/www/html/simple-lamp-master/config.php && chmod -R 777 /var/www/html/simple-lamp-master
 
 EXPOSE 80
 EXPOSE 3306

 ENTRYPOINT ["/lib/systemd/systemd"]
````
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/08961fd6-afe8-482d-a0bd-5ce3e2cda1cf)

3.Написать Dockerfile для LAMP приложения, который устанавливает только само приложение в Apache. Написать docker-compose.yaml, который разворачивает зависимости приложения (MySQL и Memcached) и запускает само приложение. Обратить внимание на /docker-entrypoint-initdb.d mount для MySQL, использование которого описано в документации к MySQL Docker образу. Посмотреть, что такое wait-for-it.sh и придумать, как его можно заиспользовать в этом задании.
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/2ad83859-6e48-4aa5-ac62-8d1d587db180)
-
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/e4739129-f2c0-4f24-a759-007bd7851960)



