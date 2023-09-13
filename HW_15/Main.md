1. Установить MySQL на VM.

al@al-VirtualBox:~$ sudo apt install mysql-server mysql-client

3. Создать схему БД clinic и наполнить её данными используя скрипты из https://github.com/tms-dos17-onl/_sandbox/tree/main/lecture18/mysql/initdb.d/data.

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/76bc7c14-ce0b-49e7-bd2c-96efb71ee917)

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/ed960f8f-48e9-4966-b0d2-c62e39b6b7af)

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/45428d50-6c4a-4a80-8888-dd6ffa6cc683)

4

al@al-VirtualBox:~$ sudo mysqldump -uroot -p******** clinic > /var/lib/mysql/clinic_1.sql

al@al-VirtualBox:~$ sudo ls /var/lib/mysql/
````
 al-VirtualBox.pid   binlog.000007   binlog.000015   ca-key.pem		  ib_buffer_pool       private_key.pem
 auto.cnf	     binlog.000008   binlog.000016   ca.pem		  ibdata1	       public_key.pem
 binlog.000001	     binlog.000009   binlog.000017   client-cert.pem	  ibtmp1	       server-cert.pem
 binlog.000002	     binlog.000010   binlog.000018   client-key.pem	 '#innodb_redo'        server-key.pem
 binlog.000003	     binlog.000011   binlog.000019   clinic		 '#innodb_temp'        sys
 binlog.000004	     binlog.000012   binlog.000020   debian-5.7.flag	  mysql		       test_tema
 binlog.000005	     binlog.000013   binlog.000021  '#ib_16384_0.dblwr'   mysql.ibd	       undo_001
 binlog.000006	     binlog.000014   binlog.index   '#ib_16384_1.dblwr'   performance_schema   undo_002
````
5
-
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/2b44c9df-6c20-4b3d-8fed-503d7d55ad99)
-
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/ee496ad0-e90a-4a87-8913-32e85508384d)
-
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/897321c8-9535-4ea6-a4c2-67bfc6bdde0a)

mysql> DELETE FROM Doctor, Appointment WHERE Doctor.id = 1 AND Appointment.id = 1;
