1. Сгенерировать пару ключей/сертификатов (private.pem и public.pem) при помощи OpenSSL.

al@al-VirtualBox:~/certificate$ sudo openssl genrsa -out private.pem 2048

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

al@al-VirtualBox:~/script$ echo "dfsdfd"|./secret.sh 
````
�q�Q;�[�9�/j���s</�g���K�
                       d�;Ql��Zr?/��Ho2Y�y��E}yu�r
                                                  ��zmO��F�mږ�
y%�6�T���C�o��	[��.�Ch��Ar�y��8��bYN�q��CS�p�<���Q���^��G�$��F��*8� ������Z�ؔH���ݽ���ܾ��n+��p�M'��4�	A��*���υ��������q��F	`��al@al-VirtualBox:~/script$
````
