1. Скопировать папку https://github.com/tms-dos17-onl/_sandbox/tree/main/lecture15/api на VM и запустить Python REST Api приложение согласно инструкции. Проверить работоспособность всех доступных REST Api методов с помощью Swagger.
2. Установить Nginx на VM и настроить его как Reverse Proxy для Python REST Api приложения из предыдущего пункта.
3. Установить JMeter и написать тестовый сценарий для проверки производительности приложения путем выполнения HTTP GET запроса http://<NGINX_IP>:<NGINX_PORT>/ping от 100 пользователей.

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/0b2ffbfd-6d53-4b93-b8bf-f1c8073a1a3b)

![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/de06571c-b472-4558-9ddb-6dca9711ede3)

4. Запустить ещё один экземпляр Python REST Api приложения на другом порту.
5. Изменить конфигурацию Nginx, чтобы он использовал в качестве бэкенда 2 приложения.
6. Повторить JMeter сценарий и сравнить результаты.


![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/c3d633f0-75ee-421e-b84f-339229533100)


![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/49db0bb0-e7dc-44a8-b24c-4ed0151e0159)

В тот раз было 9000мс , а тепер 3800мс,  запросы распределились по двум портам и нагрузка снизилась.

