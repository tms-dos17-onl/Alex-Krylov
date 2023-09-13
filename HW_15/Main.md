1. Установить MySQL на VM.

al@al-VirtualBox:~$ sudo apt install mysql-server mysql-client

3. Создать схему БД clinic и наполнить её данными используя скрипты из https://github.com/tms-dos17-onl/_sandbox/tree/main/lecture18/mysql/initdb.d/data.

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/76bc7c14-ce0b-49e7-bd2c-96efb71ee917)

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/ed960f8f-48e9-4966-b0d2-c62e39b6b7af)

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/45428d50-6c4a-4a80-8888-dd6ffa6cc683)

4

al@al-VirtualBox:~$ sudo mysqldump -uroot -p******** clinic > /var/lib/mysql/clinic_1.sql
