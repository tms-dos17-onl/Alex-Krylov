1. Работа с Google Cloud Storage (GCS):
- Создать GCE, открыть SSH сессию в созданную VM.
- Cклонировать репозиторий и ознакомиться с проектом и инструкцией к нему.
- Создать необходимые ресурсы для работы приложения:
- Создать GCS Bucket <LASTNAME>-gcs-demo.
- Создать Service Account <LASTNAME>-gcs-demo и назначьте ему роль Storage Object Admin (IAM & Admin -> IAM -> GRANT ACCESS)
---
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/6c7d3fa7-3a5c-4564-a36c-149e1b2b3885)

---
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/9fd46fdd-cdbb-4549-9eb2-c6d71f6847c2)

---
- Сгенерировать и скачать Service Account Key в формате JSON.
- Установить Node.js 18.
- Установить зависимости приложения через NPM.
- Поправить имя GCS Bucket и имя файла с Service Account Key в каком-то из .js файлов приложения.
- Запустить приложение и проверить его работоспособность путем выполнение нескольких HTTP запросов через Postman как описано в Node.js upload File to Google Cloud Storage example параграфе.
---
sudo apt install nodejs
npm install @google-cloud/storage express multer cors
---
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/e6d044bc-671e-4bad-b081-3e6237e7a948)

---
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/b815af73-d486-4b67-b0b7-adcec30238bb)

---
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/ca9c51ad-414a-4044-9729-501abb1b46dc)

---
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/31463224-61a1-4696-9dfc-104c4d991ba7)

---

gsutil cp gs://krylov-gcs-demo/hjk.txt .

gcloud auth activate-service-account krylov-gcs-demo@tidal-mason-406418.iam.gserviceaccount.com  --key-file=tidal-mason-406418-c187d691ed48.json --project=tidal-mason-406418
-----------------------------
2. Настройка автомасштабирования:
- Создать шаблон виртуальной машины apache-php-template:
- Активировать Allow HTTP traffic.
- В качестве startup скрипта написать команды для установки Apache веб-сервера с поддержкой PHP и создания phpinfo страницы (<?php phpinfo(); ?>).
- Создать группу виртуальных машин apache-php-group с помощью шаблона apache-php-template:
- Использовать мультизональную локацию.
- Настроить автомасштабирование от 2 до 4 экземпляров.
- Понизить порог для автомасштабирования до 30% CPU.
- Создать Application Load Balancer:
- В качестве Backend использовать ранее созданную группу VM apache-php-group:
- Выключить Cloud CDN.
- В качестве, Health Check использовать просто проверку доступности домашней страницы Apache.
- Проверить распределение трафика путем выполнения HTTP запроса GET /index.php через Load Balancer и сравнения свойства SERVER_ADDR в phpinfo таблице.
- Сгенерировать нагрузку на Load Balancer и убедиться, что работает автомасштабирование.
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/76b28953-224c-4dae-9b09-8eb2b8cf8c32)

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/9e2ef096-9931-4da9-92d4-fe81b7d3c11a)

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/507b1457-3b9d-4c55-81c2-898a446e1879)

Здесь видно, что меняются машины исполнения запроса
![Безымянный](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/f6ae6849-b09b-4e2c-a9cc-f7a2c216962b)

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/c11f4271-281d-46ea-8927-2bec9045ca30)

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/42a39b1f-cd38-4511-9f0c-f3f445ec2b14)

Добавил еще 2 машины
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/33f84576-868e-4f16-8393-bbcc37bdf33a)



