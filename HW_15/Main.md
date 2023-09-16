1. Установить MySQL на VM.

al@al-VirtualBox:~$ sudo apt install mysql-server mysql-client

3. Создать схему БД clinic и наполнить её данными используя скрипты из https://github.com/tms-dos17-onl/_sandbox/tree/main/lecture18/mysql/initdb.d/data.

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/76bc7c14-ce0b-49e7-bd2c-96efb71ee917)

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/ed960f8f-48e9-4966-b0d2-c62e39b6b7af)

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/45428d50-6c4a-4a80-8888-dd6ffa6cc683)

4. Создать бэкап базы данных clinic.

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
5. Написать следующие SQL запросы:
- Вывести всех врачей, работающих в терапевтическом отделении
- 
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/2b44c9df-6c20-4b3d-8fed-503d7d55ad99)
- Вывести в каких отделениях побывал каждый пациент.
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/ee496ad0-e90a-4a87-8913-32e85508384d)
- Обновить дату приёма для пациента Ивана Иванова на 2022-02-09.
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/897321c8-9535-4ea6-a4c2-67bfc6bdde0a)
- Удалить врача Андрея Быкова и все его приёмы.

mysql> SET FOREIGN_KEY_CHECKS=0;
````
Query OK, 0 rows affected (0.00 sec)
````
mysql> DELETE Doctor, Appointment FROM Doctor INNER JOIN Appointment ON Doctor.id = Appointment.Doctor_id WHERE Doctor.id = 1 AND Appointment.id = 1;
````
Query OK, 2 rows affected (0.05 sec)
````
mysql> SET FOREIGN_KEY_CHECKS=1;
````
Query OK, 0 rows affected (0.00 sec)
````
mysql> SELECT * FROM Appointment;
````
+----+---------------------+------------+-----------+---------+
| id | Date                | Patient_id | Doctor_id | Room_id |
+----+---------------------+------------+-----------+---------+
|  2 | 2022-02-09 00:00:00 |          3 |         2 |       1 |
|  3 | 2022-02-09 00:00:00 |          1 |         3 |       4 |
|  4 | 2022-02-01 00:00:00 |          2 |         4 |       3 |
|  5 | 2022-02-03 00:00:00 |          4 |         5 |       2 |
+----+---------------------+------------+-----------+---------+
4 rows in set (0.00 sec)
````
mysql> SELECT * FROM Doctor;
````
+----+----------------+--------------------+---------------+-----------------------------+------------+
| id | FirstName      | LastName           | Telephone     | Email                       | BirthDate  |
+----+----------------+--------------------+---------------+-----------------------------+------------+
|  2 | Иван           | Купитман           | +37529XXXXXXX | ivan.kupitman@clinic.com    | 1963-03-13 |
|  3 | Дмитрий        | Левин              | +37529XXXXXXX | dmitry.levin@clinic.com     | 1986-01-15 |
|  4 | Варвара        | Черноус            | +37529XXXXXXX | varvara.chernous@clinic.com | 1988-04-14 |
|  5 | Глеб           | Романенко          | +37529XXXXXXX | gleb.romanenko@clinic.com   | 1984-09-19 |
|  6 | Семён          | Лобанов            | +37529XXXXXXX | semen.lobanoff@clinic.com   | 1983-11-22 |
+----+----------------+--------------------+---------------+-----------------------------+------------+
5 rows in set (0.00 sec)
````
- Добавить нового врача Фила Ричардса и новую пациентку Василису Васильеву и записать её к Филу Ричардсу на приём на 2022-02-14.
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/d1782856-067f-47c8-b978-c3e8e45ed7dd)
-
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/faefa751-5f22-4b8f-be4e-d575f883ddc1)

-
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/22031bdb-4342-427d-8eea-aa6cffc969b2)

6. Восстановить базу данных clinic из бэкапа и проверить, что данные соответствуют состоянию базы данных до внесенных в предыдущем задании изменений.

Можно через source

mysql> source /var/lib/mysql/clinic_1.sql;

А можно через команду в Linux

al@al-VirtualBox:/home$ sudo sh -c "cd /var/lib/mysql; mysql clinic < clinic_1.sql"

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/bf052652-1c1c-41b4-8ed2-fbde38b0b216)

7. Установить MongoDB
sudo apt-get install gnupg curl

curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

   echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

   sudo apt-get update

sudo apt-get install -y mongodb-org

8. Создать БД clinic и наполнить её данными используя скрипты из https://github.com/tms-dos17-onl/_sandbox/tree/main/lecture18/mongo/initdb.d.

clinic> db.createCollection("patient");
````
{ ok: 1 }
````
clinic> db.createCollection("doctor");
````
{ ok: 1 }
````
clinic> db.createCollection("department");
````
{ ok: 1 }
````
clinic> db.createCollection("job");
````
{ ok: 1 }
````
clinic> db.createCollection("room");
````
{ ok: 1 }
````
clinic> db.createCollection("appointment");
````
{ ok: 1 }
````
clinic> load("/home/alex777888/Downloads/_sandbox-main/lecture18/mongo/initdb.d/data.js");
````
true
````

9. Написать выборочно 3 запроса из задания 5 для MongoDB используя mongosh команды.

Обновить дату приёма для пациента Ивана Иванова на 2022-02-08

clinic> db.appointment.updateOne({Date: "2022-01-08 00:00:00.000000"}, {$set: {Date : "2022-02-08 00:00:00.000000"}});
````
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
````
clinic> db.appointment.find();
````
[
  {
    _id: ObjectId("650571cf4090417e03fcf6a7"),
    id: 1,
    Date: '2022-02-08 00:00:00.000000',
    Room_id: 5,
    Doctor_id: 1,
    Patient_id: 5
  },
  {
    _id: ObjectId("650571cf4090417e03fcf6a8"),
    id: 2,
    Date: '2022-01-09 00:00:00.000000',
    Room_id: 1,
    Doctor_id: 2,
    Patient_id: 3
  },
  {
    _id: ObjectId("650571cf4090417e03fcf6a9"),
    id: 3,
    Date: '2022-01-09 00:00:00.000000',
    Room_id: 4,
    Doctor_id: 3,
    Patient_id: 1
  },
  {
    _id: ObjectId("650571cf4090417e03fcf6aa"),
    id: 4,
    Date: '2022-02-01 00:00:00.000000',
    Room_id: 3,
    Doctor_id: 4,
    Patient_id: 2
  },
  {
    _id: ObjectId("650571cf4090417e03fcf6ab"),
    id: 5,
    Date: '2022-02-03 00:00:00.000000',
    Room_id: 2,
    Doctor_id: 5,
    Patient_id: 4
  }
]
````
Удалить врача Андрея Быкова и все его приёмы

clinic> db.doctor.deleteOne({ _id : ObjectId("650571cf4090417e03fcf694")});
````
{ acknowledged: true, deletedCount: 1 }
````
clinic> db.doctor.find();
````
[
  {
    _id: ObjectId("650571cf4090417e03fcf695"),
    id: 2,
    Email: 'ivan.kupitman@clinic.com',
    LastName: 'Купитман',
    BirthDate: '1963-03-13',
    FirstName: 'Иван',
    Telephone: '+37529XXXXXXX'
  },
````
clinic> db.appointment.deleteOne({ _id : ObjectId("650571cf4090417e03fcf6a7")});
````
{ acknowledged: true, deletedCount: 1 }
````
Добавить нового врача Фила Ричардса и новую пациентку Василису Васильеву и записать её к Филу Ричардсу на приём на 2022-02-14

clinic> doctor = db.doctor.insertOne({ "id": 1, "Email": "phill.richards@clinic.com", "LastName": "Ричардс", "BirthDate": "1987-04-14", "FirstName": "Фил", "Telephone": "+37529XXXXXXX" });
````
{
    _id: ObjectId("650571cf4090417e03fcf699"),
    id: 6,
    Email: 'semen.lobanoff@clinic.com',
    LastName: 'Лобанов',
    BirthDate: '1983-11-22',
    FirstName: 'Семён',
    Telephone: '+37529XXXXXXX'
  },
  {
    _id: ObjectId("6505818c4090417e03fcf6b1"),
    id: 1,
    Email: 'phill.richards@clinic.com',
    LastName: 'Ричардс',
    BirthDate: '1987-04-14',
    FirstName: 'Фил',
    Telephone: '+37529XXXXXXX'
  }
````
clinic> patient = db.patient.insertOne({ "id": 6, "Email": "vasilisa.vasileva@example.com", "Address": "Тилимилитрямдия", "LastName": "Васильева", "BirthDate": "1990-08-16", "FirstName": "Василиса", "Telephone": "+37517XXXXXXX" });
````
{
  acknowledged: true,
  insertedId: ObjectId("650582384090417e03fcf6b2")
}
````
clinic> db.appointment.insertOne({ "id": 1, "Date": "2022-02-14 00:00:00.000000", "Room_id": 1, "Doctor_id": doctor.id, "Patient_id": patient.id });
````
{
  acknowledged: true,
  insertedId: ObjectId("650582c74090417e03fcf6b3")
}
````
