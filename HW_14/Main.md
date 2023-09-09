1. Сгенерировать пару ключей/сертификатов (private.pem и public.pem) при помощи OpenSSL.

al@al-VirtualBox:~/certificate$ sudo openssl genpkey -algorithm RSA -out private.pem -pkeyopt rsa_keygen_bits:2048

al@al-VirtualBox:~/certificate$ cat private.pem 
````
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDfulPkZ+KPtlDx
JNgw5AoLtd4T1qIvv5nYkbfbRnas59Tu/t4S5lvvXGL5ucSSMwnUQPCBXXTFe/aW
ae3lJU9pe65fBF9GdoCS+3DF621nPoTBf7EwHl/B2JRdlZN2N+aMhXXlVec/dwaB
K1xYMPOy9uujJygBSdQQSFFd0+H6gQSaPGouf2wVP2MQK70NLDgYMtW1A2ez/7F6
/4s/3rjvOdYZxWudzq25n18Y6lY2o32TLDU6rGYXtGIxrw8EQLl3n4gzCa4Wh1R3
jVxDBpKNDWFxbKWdixxfoQEuAOxzgxcsQ8RuTkuRG4Zy7tVXeU1mJCIR1R0HJ/hz
a2K+rsZlAgMBAAECggEADP/mn/7pSzBsw5ZAeZbGfqeyn7R4+A1KAyt0Y2lUu/c8
iCaHANIhxWa42YnRwiz1BUBAuUOU5WSuj07YY9gnJRnqp9q5Ln70OZYil112nekk
DZo90W3yYnETLdzjFJtq6f9XOlwjc6yW1CqQ0w8FGgD+8Bv2VxzTFZ8eGzWUi9mX
exUwxQVuEHf2FxlsLxgCbC6utmCCC/mmTFE82ohclPnq6zdSlUMZ0erQKv8V8Gov
9jf+xHlivp/3uaq3BBcqD3TYFvTpo6cGoNo7e5RPho4bOr4xGWbwo8Mib4IF0iEN
iQ+SglffQsFXVJBk2gjwKdBy5PrCjcFIixOcLdvEAQKBgQDvMiFnBHs3m/WPiScH
FZOVBCzKC/xJqXNOAHu2yba8SZoZoaCzdJz+B4q8MPpzvOwLMwE7A5yYkqweG+wz
ndpJOIgxaYCojukqF3bb+ydP/VnB8zgEVGNxuHITTEXUf2ZLk/Qr2Xs8C55EG7NR
d2U134/JddEa6RFeZLxabvOuvQKBgQDvcgKNO+KnK3AbqGVL+53pybsYOkpQ1Q5j
E9LPXiRIHru1q599OxkCLorQxH3OEnKUxL4A5/4bgIwkPniXtzHbXUhPikZK3rL8
q1L7lmgxskfwpV7b71ZRu13XHaqZ02GofrCzV+QpsqATsRDuvLs0YfeGfyGelk0J
F4wf4GgkyQKBgHhOy5QoId2HeQxX3KRoitFhxzFcs+lM7GzoO1FlxZ6QmoyXyd9Z
IPl4S6R6Mg5ykHrVjaHkIChxZVbDjpsrozY+0+meehLNxqLgKG1etpg6AqJVtfAf
jeEN93qTW3AVIBuVcDN58MzzvwfcsuWf2u0s5AJdWu5hGdZTbpVBxxk1AoGBAIiU
GYyB6ii8iDfed9k9breZz9Rj+1vcC1bMSeTqp/tTPHLFsDV4bi1matvmGHRg5Wai
Slat/a2mR0mtMJApeJDNxp9IGgw+tw2Uk8LZ6hjevlYvncoJ3MzF+SLo0xTnE79O
dG/35Dc8oj5ZM3VZxdZ9Qvk+ruiMhuh2vAC6ueyxAoGAHD/Lh2gnfQyK3oWVI3wd
ZMWBJkcGiXfU6ym8HvWLTsH3f1qAC+zPgGKcC6E99z4MeqILcTpHiPeLSoz4tM0J
5IRADKSoaB8EskUkKo+N6nh4wGjmNwtyDCMqhdebSJLjeLmAZTxGVEQqXrahYxr/
FZfZhLoyHSszzxXBN/7NpDE=
-----END PRIVATE KEY-----
````
al@al-VirtualBox:~/certificate$ sudo openssl rsa -in private.pem -pubout -out public.pem 
````
writing RSA key
````
al@al-VirtualBox:~/certificate$ cat public.pem 
````
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA37pT5Gfij7ZQ8STYMOQK
C7XeE9aiL7+Z2JG320Z2rOfU7v7eEuZb71xi+bnEkjMJ1EDwgV10xXv2lmnt5SVP
aXuuXwRfRnaAkvtwxettZz6EwX+xMB5fwdiUXZWTdjfmjIV15VXnP3cGgStcWDDz
svbroycoAUnUEEhRXdPh+oEEmjxqLn9sFT9jECu9DSw4GDLVtQNns/+xev+LP964
7znWGcVrnc6tuZ9fGOpWNqN9kyw1OqxmF7RiMa8PBEC5d5+IMwmuFodUd41cQwaS
jQ1hcWylnYscX6EBLgDsc4MXLEPEbk5LkRuGcu7VV3lNZiQiEdUdByf4c2tivq7G
ZQIDAQAB
-----END PUBLIC KEY-----
````
2. Создать скрипт encrypt.sh, который считывает стандартный поток ввода, шифрует его при помощи public.pem через OpenSSL и выводит в стандартный поток вывода.

al@al-VirtualBox:~/script$ ./encrypt.sh 
````
ghgfh
lb6mXezNIWWCAkt7tsx61l2kU7J6ZygmvucaPf5L9ahcJExECiqmA8sdOMwLljZSwUXTA+iNScWY
Nzt2J4P2sKJc8IPLiEWWO7zqPAC5PgLOXowszIMWvg+Ncd8RxYB2ZGaATqGfboPE9h6yyaqJfrJu
3XLT8aAiUvm9eU4j0I+m0/xBLTPVdcqZx9PKrP5ix5HqUrcibdrYfQD7VULTmCWsZl/WekFjPBgm
qyVgAKLSnd+8ptsR/6f5IxNSpRUuLnXPegBRiYsGzwQ7yZ9ogy0XO6WhA/bRsRJvfpAUz53Mhqs4
qu6p6Qbc7T7JOBVnDRySY+c1oKiX7j5jxjFcFg==
````
3. Создать скрипт decrypt.sh, который считывает стандартный поток ввода, расшифровывает его при помощи private.pem через OpenSSL и выводит в стандартный поток вывода.

Вариант 1

echo "Hello,World" > /home/al/certificate/sec.txt |./decrypt.sh

al@al-VirtualBox:~/script$ cat /home/al/certificate/sec.txt
````
Hello,World
````
al@al-VirtualBox:~/script$ cat /home/al/certificate/sec1.txt
````
y�=7@�d]�Z_��ޗ�����+ů���f��/����&Ă�?�G����2U� &�7]>$�jk^
cƊ}�~��?ړR`ȶ#���E9��
)��mXV�������i��N�N�̼��,zl;�����0Z������D�^al@al-VirtualBox:~/script$ H)�zd��`q�	��͋e�2j�1���
````
al@al-VirtualBox:~/script$ cat /home/al/certificate/sec2.txt
````
Hello,World
````

Вариант 2

al@al-VirtualBox:~/script$ ./decrypt.sh 
````
ertert5
ICLPzoRO1OmgButOXVNFS5i3ZdwLy5Yysf8yhNPz0tROrNmWa3VC85jCeDx+ApeghHqLHgsOI+/d
LUfSlCGrItVtU16F18VpyrZVI6g3Zv2BXpXdYvUERxG1zBLnviX5lrseZkmHijh5WtP0ryG3tfTA
78wa2axkh4TmK9rwrHi0nVwZoqtnrPPZm+qlEbBkYPQTYevhcwbX+CtXwGwkxRIdW5Y/u3nnQkEY
dG8S0pzwxNQcVu72XSBXAj65m4j2WJXbSKgMx9iCUW6WVSk92ltzRzJVsPgtNYqR5S2AFYpFSmDg
ndNqKPckwYL/lOp2Z+FNbo91l/FfGqOVofgEhg==
ertert5
````
al@al-VirtualBox:~/certificate$ openssl req -in certyficate.csr -noout -text

4. Сгенерировать публичный сертификат public-nginx.pem для private.pem через OpenSSL, используя <LASTNAME>.io в качестве Common Name (CN).

al@al-VirtualBox:~/certificate$ openssl req -new -key private.pem -out certyficate.csr

al@al-VirtualBox:~/certificate$ openssl req -in certyficate.csr -noout -text
````
Certificate Request:
    Data:
        Version: 1 (0x0)
        Subject: C = AU, ST = Some-State, O = Internet Widgits Pty Ltd, CN = Krylov.io
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (2048 bit)
                Modulus:
                    00:ac:28:ea:e1:0d:53:3b:9d:39:42:4b:16:ad:e9:
                    a5:fa:f8:5f:58:7a:4e:b9:3b:18:a9:5f:ea:4a:f6:
                    b6:08:f2:3a:75:70:34:a9:70:a3:ba:57:ec:bc:cd:
                    61:a7:cf:08:58:c0:27:9e:98:e1:6d:e0:da:1c:fb:
                    a7:94:82:4e:44:f9:ed:4b:d7:d3:64:14:22:1b:9a:
                    32:0e:8c:19:6c:11:7a:6d:13:b7:6f:22:2d:34:03:
                    df:22:fa:4e:f7:0f:fc:ce:70:ca:c2:7e:f7:3a:3c:
                    b2:39:54:48:a0:bd:e1:95:1d:62:ea:d8:b6:4f:21:
                    2d:fb:92:ca:a1:1c:14:22:9e:ea:3a:2a:3a:ba:ad:
                    ae:d8:57:97:77:12:f6:c7:f6:df:87:f4:56:83:1a:
                    85:e6:fc:9d:14:86:c3:51:b5:ad:06:83:60:54:77:
                    d1:a1:85:bf:e1:3b:26:c1:cc:af:9c:da:c0:e4:56:
                    32:87:ba:0b:70:0c:96:7b:ac:1a:3c:30:f5:b4:21:
                    61:29:ca:4f:69:80:ad:49:01:65:66:2b:42:15:ca:
                    b4:83:29:d1:ac:2c:3c:98:83:48:02:29:a7:08:79:
                    3d:72:d8:09:d5:ce:f8:58:d6:af:92:f8:67:5e:c6:
                    ac:a3:7b:03:9b:5d:7b:85:a1:06:e4:30:83:cf:b6:
                    54:6d
                Exponent: 65537 (0x10001)
        Attributes:
            (none)
            Requested Extensions:
    Signature Algorithm: sha256WithRSAEncryption
    Signature Value:
        32:e9:a0:12:46:5a:59:ae:79:f9:a3:f7:74:5d:5c:0f:2c:25:
        79:4f:33:48:2d:a1:ea:ff:c2:3a:e9:d3:b5:c0:27:a4:1f:c6:
        4f:c6:10:ba:03:88:ae:41:70:79:3c:a9:f8:fe:a6:c2:80:39:
        af:eb:1e:cf:df:80:0e:be:b7:74:43:ff:8d:a7:63:67:dd:87:
        65:67:0c:f4:1c:3f:2c:9c:2d:bd:2d:1c:4f:cf:82:99:69:6a:
        7d:e7:09:03:78:38:ff:09:39:4c:71:fe:f5:5a:2b:bb:ad:a2:
        21:ac:e5:78:9e:03:12:49:48:0f:69:88:de:f4:f3:d5:00:32:
        96:a2:18:32:aa:7d:e6:40:ed:8d:ad:6e:6d:3b:4a:a1:45:66:
        b4:0b:1f:4c:90:b8:aa:6e:31:d9:50:ff:72:f4:bd:6f:03:04:
        59:cc:93:25:05:44:4c:b1:88:3f:02:76:45:a1:43:2c:b3:20:
        30:6f:c2:60:cc:3e:5c:62:05:1d:32:7b:6f:61:ee:78:a6:67:
        74:e4:e6:dd:40:1d:05:d0:25:99:04:63:1d:a0:3e:7f:8e:44:
        66:63:dc:bf:99:f9:88:c5:9c:d9:0b:cc:30:20:62:d0:2c:85:
        e6:e5:96:5e:2a:c3:53:bb:e9:61:9f:ee:62:d5:db:4d:d2:4f:
        37:d4:68:f0
````
al@al-VirtualBox:~/certificate$ openssl x509 -signkey private.pem -in certyficate.csr -req -days 365 -out certificate.crt
````
Certificate request self-signature ok
subject=C = AU, ST = Some-State, O = Internet Widgits Pty Ltd, CN = Krylov.io
````
al@al-VirtualBox:~/certificate$ openssl x509 -in certificate.crt -noout -text

````
Certificate:
    Data:
        Version: 1 (0x0)
        Serial Number:
            4e:41:58:8d:5f:76:5a:33:28:63:ad:8d:ac:0d:c6:ae:04:9a:ba:b9
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: C = AU, ST = Some-State, O = Internet Widgits Pty Ltd, CN = Krylov.io
        Validity
            Not Before: Sep  7 15:16:11 2023 GMT
            Not After : Sep  6 15:16:11 2024 GMT
        Subject: C = AU, ST = Some-State, O = Internet Widgits Pty Ltd, CN = Krylov.io
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (2048 bit)
                Modulus:
                    00:ac:28:ea:e1:0d:53:3b:9d:39:42:4b:16:ad:e9:
                    a5:fa:f8:5f:58:7a:4e:b9:3b:18:a9:5f:ea:4a:f6:
                    b6:08:f2:3a:75:70:34:a9:70:a3:ba:57:ec:bc:cd:
                    61:a7:cf:08:58:c0:27:9e:98:e1:6d:e0:da:1c:fb:
                    a7:94:82:4e:44:f9:ed:4b:d7:d3:64:14:22:1b:9a:
                    32:0e:8c:19:6c:11:7a:6d:13:b7:6f:22:2d:34:03:
                    df:22:fa:4e:f7:0f:fc:ce:70:ca:c2:7e:f7:3a:3c:
                    b2:39:54:48:a0:bd:e1:95:1d:62:ea:d8:b6:4f:21:
                    2d:fb:92:ca:a1:1c:14:22:9e:ea:3a:2a:3a:ba:ad:
                    ae:d8:57:97:77:12:f6:c7:f6:df:87:f4:56:83:1a:
                    85:e6:fc:9d:14:86:c3:51:b5:ad:06:83:60:54:77:
                    d1:a1:85:bf:e1:3b:26:c1:cc:af:9c:da:c0:e4:56:
                    32:87:ba:0b:70:0c:96:7b:ac:1a:3c:30:f5:b4:21:
                    61:29:ca:4f:69:80:ad:49:01:65:66:2b:42:15:ca:
                    b4:83:29:d1:ac:2c:3c:98:83:48:02:29:a7:08:79:
                    3d:72:d8:09:d5:ce:f8:58:d6:af:92:f8:67:5e:c6:
                    ac:a3:7b:03:9b:5d:7b:85:a1:06:e4:30:83:cf:b6:
                    54:6d
                Exponent: 65537 (0x10001)
    Signature Algorithm: sha256WithRSAEncryption
    Signature Value:
        47:1e:a0:12:f3:12:44:b1:5b:25:04:90:93:fb:fd:08:ab:36:
        07:6a:b1:81:85:1b:95:31:2c:91:d2:d2:c2:ce:f4:02:9b:c3:
        92:99:5e:07:c0:35:7b:46:01:14:71:d6:26:29:c7:f5:17:3b:
        13:5a:76:35:d3:1c:f4:2a:58:8e:f5:ed:35:53:12:38:91:f4:
        b9:e9:d7:a8:c9:00:86:2e:e8:69:94:fe:76:ce:34:ea:5f:e2:
        f3:3d:eb:85:90:0c:5a:4d:f5:0e:5c:99:07:9d:82:9e:86:a3:
        d4:4b:35:9b:64:c7:95:4a:2b:38:74:ed:15:51:1a:68:e0:f7:
        05:01:5b:e4:fe:7e:df:cc:11:1d:b0:0b:8f:26:dd:70:18:82:
        c9:57:69:50:b4:b2:77:dc:14:11:d0:1c:0c:df:39:73:a9:e1:
        a4:2b:04:f3:2e:30:b7:8b:2b:72:a0:c7:00:5e:93:75:82:66:
        23:f1:b3:96:08:2b:6a:96:98:bf:4b:90:d0:9d:71:17:05:34:
        97:9b:89:97:c3:af:a8:73:85:48:a7:5f:70:0b:8f:b8:61:0b:
        ef:33:ef:97:1e:54:e9:84:11:1c:8e:6c:96:62:34:d9:8f:4c:
        46:ee:ce:ee:58:d1:10:23:52:51:de:70:21:52:66:48:49:51:
        9f:1a:93:6e
````
5. Настроить Nginx на работу по HTTPS, используя сертификаты из предыдущего задания. Например, чтобы Nginx возвращал домашнюю страницу по HTTPS.

al@al-VirtualBox:~$ cat /etc/nginx/sites-available/default |grep -ve "#" -ve "^$"
````
server {
        listen 82;
        listen [::]:82;
	 listen 443 ssl default_server;
	 listen [::]:443 ssl default_server;
        ssl_certificate      certificate.crt;
        ssl_certificate_key  private.pem;
	root /var/www/html;
	index index.php index.html index.htm index.nginx-debian.html;
	server_name _;
	location / {
		try_files $uri $uri/ =404;
	}
	location ~ \.php$ {
		include snippets/fastcgi-php.conf;
		fastcgi_pass unix:/run/php/php7.4-fpm.sock;
	}
        location ~ /\.ht {
		deny all;
	}
}
````
![image](https://github.com/tms-dos17-onl/Alex-Krylov/assets/139115675/fa817977-70e4-462b-87b6-dc9f524f72ee)

openssl x509 -req -signkey ver2.key -in ver2.csr -out ver2.crt -days 365 -extensions v3_req -extfile /home/al/milti/ope.cnf -nodes
https://losst.pro/ustanovka-sertifikatov-v-ubuntu
openssl req -new -x509 -key ver2.key -in ver2.csr -out ver2.crt -days 365 -config /home/al/milti/ope.cnf


