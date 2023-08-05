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

3. Вывести ARP таблицу на хосте и найти там запись, соответствующую MAC адресу с предыдущего задания. Если её нет, то объяснить почему.

Как видно записи с VM нет.Тут я тоже не уверен если вы поясните мне по подробней, буду рад.Поскольку VM создает виртуальный сетевой интерфей то провайдер выдает ему другой локалный IP в другом классе сети.Следовательно мой ПК не видет его мак адресса.

C:\Users\kullb>arp -a
```
Интерфейс: 192.168.56.1 --- 0x3
  адрес в Интернете      Физический адрес      Тип
  192.168.56.255        ff-ff-ff-ff-ff-ff     статический
  224.0.0.22            01-00-5e-00-00-16     статический
  224.0.0.187           01-00-5e-00-00-bb     статический
  224.0.0.250           01-00-5e-00-00-fa     статический
  224.0.0.251           01-00-5e-00-00-fb     статический
  224.0.0.252           01-00-5e-00-00-fc     статический
  239.192.152.143       01-00-5e-40-98-8f     статический
  239.255.250.250       01-00-5e-7f-fa-fa     статический
  239.255.255.250       01-00-5e-7f-ff-fa     статический
  239.255.255.251       01-00-5e-7f-ff-fb     статический

Интерфейс: 192.168.2.88 --- 0x14
  адрес в Интернете      Физический адрес      Тип
  192.168.2.1           50-ff-20-5c-6d-9c     динамический
  192.168.2.76          70-26-05-f9-cd-9b     динамический
  192.168.2.255         ff-ff-ff-ff-ff-ff     статический
  224.0.0.22            01-00-5e-00-00-16     статический
  224.0.0.187           01-00-5e-00-00-bb     статический
  224.0.0.250           01-00-5e-00-00-fa     статический
  224.0.0.251           01-00-5e-00-00-fb     статический
  224.0.0.252           01-00-5e-00-00-fc     статический
  224.0.0.253           01-00-5e-00-00-fd     статический
  239.255.250.250       01-00-5e-7f-fa-fa     статический
  239.255.255.250       01-00-5e-7f-ff-fa     статический
  239.255.255.251       01-00-5e-7f-ff-fb     статический
  255.255.255.255       ff-ff-ff-ff-ff-ff     статический

Интерфейс: 192.168.176.1 --- 0x25
  адрес в Интернете      Физический адрес      Тип
  192.168.191.255       ff-ff-ff-ff-ff-ff     статический
  224.0.0.22            01-00-5e-00-00-16     статический
  224.0.0.187           01-00-5e-00-00-bb     статический
  224.0.0.250           01-00-5e-00-00-fa     статический
  224.0.0.251           01-00-5e-00-00-fb     статический
  239.192.152.143       01-00-5e-40-98-8f     статический
  239.255.250.250       01-00-5e-7f-fa-fa     статический
  239.255.255.250       01-00-5e-7f-ff-fa     статический
  239.255.255.251       01-00-5e-7f-ff-fb     статический
  255.255.255.255       ff-ff-ff-ff-ff-ff     статический
```
4. Выполнить разбиение сети 172.20.0.0/16

172.20.0.0/16 Тут 65к хостов на эту сеть
   
Первая Подсеть
```

172.20.0.0 Подсеть

172.20.0.1 Первый пользователь

172.20.0.254 Последный хост

172.20.0.255 Широкавещательный адресс
```
и тд..

Последняя Подсеть 
```

172.20.255.0 Подсеть

172.20.255.1 Первый пользователь

172.20.255.254 Последный хост

172.20.255.255 Широкавещательный адресс
```

Всего будет 255 Полсетей

В одной Подсети бует по 254 хоста

Первая Подсеть
```
172.20.0.0     
172.20.0.1          
172.20.0.254         
```
Вторая Подсеть

```
172.20.1.0 
172.20.1.1
172.20.1.254
```



al@al-VirtualBox:~$ dig ya.ru

; <<>> DiG 9.18.12-1ubuntu1.1-Ubuntu <<>> ya.ru
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 62329
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;ya.ru.				IN	A

;; ANSWER SECTION:
ya.ru.			360	IN	A	5.255.255.242
ya.ru.			360	IN	A	77.88.55.242

;; Query time: 0 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Sat Aug 05 22:05:36 +03 2023
;; MSG SIZE  rcvd: 66

al@al-VirtualBox:~$ curl 5.255.255.242 -LH 'Host: ya.ru'

<!doctype html><html prefix="og: http://ogp.me/ns#"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title data-react-helmet="true">Ой!</title><meta data-react-helmet="true" property="og:title" content="Яндекс"><meta data-react-helmet="true" property="og:description" content="Найдётся всё"><meta data-react-helmet="true" property="og:image" content="https://yastatic.net/s3/home-static/_/37/37a02b5dc7a51abac55d8a5b6c865f0e.png"><link rel="stylesheet" href="/captcha_smart.a737a5c9dbdd19f5b829.min.css?k=1688990308309"><style>@media only screen and (min-width:651px){body{background-image:url('https://captcha-backgrounds.s3.yandex.net/static/default-background.jpg')}}.LogoLink{background-image:url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iODYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNzggOTEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgZmlsbD0ibm9uZSI+PHBhdGggZD0iTTI0OS43ODkgODQuODY4OVY3Mi40MTQ2QzI0NSA3NS42MjQ1IDIzNi45NzYgNzguNDQ5MiAyMjkuNDY5IDc4LjQ0OTJDMjE4LjIxIDc4LjQ0OTIgMjEzLjkzOSA3My4xODUgMjEzLjI5MSA2Mi4zOTk4SDI1MC40MzZWNTQuMzEwOUMyNTAuNDM2IDMxLjg0MTcgMjQwLjQ3MSAyMy4zNjc3IDIyNS4wNjkgMjMuMzY3N0MyMDYuMzAzIDIzLjM2NzcgMTk3LjM3MiAzNy42MTk1IDE5Ny4zNzIgNTcuMTM1NkMxOTcuMzcyIDc5LjYwNDcgMjA4LjUwMyA5MC41MTgzIDIyOC4xNzUgOTAuNTE4M0MyMzguMDExIDkwLjUxODMgMjQ1LjI1OSA4Ny45NTA0IDI0OS43ODkgODQuODY4OVpNMzQ2LjA4MSA5MC41MTgzQzM1My4xOTkgOTAuNTE4MyAzNTguMjQ3IDg5LjIzNDMgMzYyIDg2LjUzOFY3NC4wODM3QzM1OC4xMTcgNzYuNzggMzUzLjQ1OCA3OC40NDkyIDM0Ni45ODcgNzguNDQ5MkMzMzUuOTg2IDc4LjQ0OTIgMzMxLjQ1NiA2OS45NzUxIDMzMS40NTYgNTYuNjIyQzMzMS40NTYgNDIuNjI2OSAzMzcuMDIxIDM1LjQzNjggMzQ3LjExNiAzNS40MzY4QzM1My4wNyAzNS40MzY4IDM1OC44OTQgMzcuNDkxMSAzNjIgMzkuNDE3MVYyNi40NDkyQzM1OC43NjQgMjQuNjUxNiAzNTMuMDcgMjMuMzY3NyAzNDUuNDM0IDIzLjM2NzdDMzI1Ljc2MSAyMy4zNjc3IDMxNS41MzcgMzcuMzYyNyAzMTUuNTM3IDU3LjAwNzJDMzE1LjUzNyA3OC41Nzc2IDMyNS41MDIgOTAuNTE4MyAzNDYuMDgxIDkwLjUxODNaTTEwOC43MTcgMjQuNjUxNlY1MC4yMDIySDg4LjEzODJWMjQuNjUxNkg3Mi43MzY3Vjg5LjIzNDNIODguMTM4MlY2Mi4yNzE0SDEwOC43MTdWODkuMjM0M0gxMjQuMTE4VjI0LjY1MTZIMTA4LjcxN1pNMTkzLjYxOSA3Ny4xNjUySDE4Ni43NTlWMjQuNjUxNkgxNDEuODQ5VjMwLjE3MjZDMTQxLjg0OSA0NS45NjUyIDE0MC44MTQgNjYuMzggMTM1LjM3OCA3Ny4xNjUySDEzMC41ODlWMTA0SDE0NC44MjZWODkuMjM0M0gxNzkuMzgyVjEwNEgxOTMuNjE5Vjc3LjE2NTJaTTI5OC45NyA4OS4yMzQzSDMxNi40NDNMMjkxLjcyMyA1NC40MzkzTDMxMy40NjYgMjQuNjUxNkgyOTcuOTM1TDI3Ni4xOTIgNTQuNDM5M1YyNC42NTE2SDI2MC43OVY4OS4yMzQzSDI3Ni4xOTJWNTcuNTIwOEwyOTguOTcgODkuMjM0M1pNMjI0LjgxIDM1LjQzNjhDMjMyLjQ0NiAzNS40MzY4IDIzNC43NzYgNDEuNzI4MiAyMzQuNzc2IDQ5LjgxNzFWNTEuMTAxSDIxMy4yOTFDMjEzLjY4IDQwLjgyOTQgMjE3LjQzMyAzNS40MzY4IDIyNC44MSAzNS40MzY4Wk0xNzEuMzU4IDc3LjE2NTJIMTQ5LjYxNUMxNTMuODg2IDY3LjQwNzIgMTU1LjA1MSA0OS44MTcxIDE1NS4wNTEgMzguNjQ2N1YzNi43MjA4SDE3MS4zNThWNzcuMTY1MloiIGZpbGw9ImJsYWNrIj48L3BhdGg+CiAgICAgICAgPHBhdGggZD0iTTQ0LjEzMzcgODkuMjM0Nkg1OS43OTRWMEgzNy4wMTUzQzE0LjEwNzIgMCAyLjA3MDc5IDExLjY4NCAyLjA3MDc5IDI4Ljg4ODlDMi4wNzA3OSA0Mi42MjcyIDguNjcxNDMgNTAuNzE2IDIwLjQ0OSA1OS4wNjE3TDAgODkuMjM0NkgxNi45NTQ2TDM5LjczMzMgNTUuNDY2N0wzMS44Mzg0IDUwLjIwMjVDMjIuMjYxIDQzLjc4MjcgMTcuNjAxNyAzOC43NzUzIDE3LjYwMTcgMjcuOTkwMUMxNy42MDE3IDE4LjQ4ODkgMjQuMzMxOCAxMi4wNjkxIDM3LjE0NDggMTIuMDY5MUg0NC4xMzM3Vjg5LjIzNDZaIiBmaWxsPSIjRkMzRjFEIj48L3BhdGg+PC9zdmc+')}</style><div id="root"><div class="Theme Theme_color_yandex-default Theme_root_default"><div class="Container"><div class="Spacer" style="padding-bottom:40px"><a href="https://www.ya.ru" title="Yandex" class="Link Link_view_default LogoLink"></a></div><form method="POST" action="/checkcaptcha?key=ba31914b-a8b2fce9-b32f7592-b47e4acf_2/1691264077/75f03b1df87dda711f569fd4cf565547_860666e4e4a55348614e8e7f35f587e9&mt=B423C0870716AF6A6E77FB04F53DD765351D2C43B048495DA0B4C74FCDCE937A90CA8D10039FD3899C617CBEBEFCAF94FF13E45CCC8CBF4EAC1690FA24DC10AF7B893F88B37722887EB0D5B4B34694650D26442DACBD8AE6433B972B7D340E679831354620E34A75403771AD&retpath=aHR0cHM6Ly95YS5ydS8__44b41823ed7277609fdcfb8c1d7ae104&u=b59b5b8b-18693794-bde13e08-fa6005ee&s=c496e37f568a3805bc884e169a9ef597" id="checkbox-captcha-form"><div class="Spacer" style="padding-bottom:16px"><span class="Text Text_weight_medium Text_typography_headline-s">Подтвердите, что запросы отправляли вы, а не робот</span></div><div class="Spacer" style="padding-bottom:16px"><span class="Text Text_weight_regular Text_typography_body-long-m">Нам очень жаль, но запросы с вашего устройства похожи на автоматические.   <a href="https://yandex.ru/support/smart-captcha?unique_key=b59b5b8b-18693794-bde13e08-fa6005ee" class="Link Link_view_default">Почему это могло произойти?</a></span></div><noscript><span class="Text Text_color_alert Text_weight_medium Text_typography_body-long-m">У вас отключено исполнение JavaScript. По нажатию вы будете направлены на дополнительную проверку. <a href="https://yandex.ru/support/common/browsers-settings/browsers-java-js-settings.html" class="Link Link_view_default">Как включить JavaScript?</a></span></noscript><div class="Spacer Spacer_auto-gap_bottom" style="padding-top:40px;padding-bottom:40px"><div class="CheckboxCaptcha" data-testid="checkbox-captcha"><div class="CheckboxCaptcha-Inner"><div class="CheckboxCaptcha-Anchor"><input type="button" id="js-button" class="CheckboxCaptcha-Button" aria-checked="false" aria-labelledby="smartcaptcha-status" role="checkbox"><noscript><input type="submit" class="CheckboxCaptcha-Button" aria-checked="false" aria-labelledby="smartcaptcha-status" role="checkbox"></noscript><div class="CheckboxCaptcha-Checkbox" data-checked="false"><svg class="SvgIcon" width="24" height="24" viewBox="0 0 24 25" fill="none"><path d="M4 12.5L9.5 18.5L20 6.5" stroke="#000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"></path></svg></div></div><div class="CheckboxCaptcha-Label"><span class="Text Text_weight_regular Text_typography_control-xxl CheckboxCaptcha-LabelText">Я не робот</span><span class="Text Text_color_control-secondary Text_weight_regular Text_typography_control-l CheckboxCaptcha-SecondaryText">Нажмите, чтобы продолжить</span><span class="Text Text_color_ghost Text_weight_regular Text_typography_control-s CheckboxCaptcha-Links"><a target="_blank" href="https://cloud.yandex.ru/services/smartcaptcha" aria-describedby="service-link-description" class="Link Link_view_captcha">Yandex SmartCaptcha</a><span class="Links-Dot">•</span><a target="_blank" href="https://yandex.ru/legal/smartcaptcha_notice/" aria-describedby="connect-link-description" class="Link Link_view_captcha">Обработка данных</a><div class="visuallyhidden" id="service-link-description">connect-link-description</div><div class="visuallyhidden" id="privacy-link-description">Сайт с информацией об обработке данных</div></span></div><div class="CheckboxCaptcha-Icon"><svg width="41" height="20" viewBox="0 0 41 20" fill="none" class="CloudIcon"><path d="M10.251 11.0479C10.7785 12.2034 10.9542 12.6053 10.9542 13.9932V15.8333H9.07031V12.7309L5.51562 5H7.48142L10.251 11.0479ZM12.5746 5L10.2698 10.2376H12.1852L14.4963 5H12.5746Z" fill="#000"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M10 18.2292C14.5448 18.2292 18.2292 14.5448 18.2292 10C18.2292 5.45516 14.5448 1.77083 10 1.77083C5.45516 1.77083 1.77083 5.45516 1.77083 10C1.77083 14.5448 5.45516 18.2292 10 18.2292ZM10 20C15.5228 20 20 15.5228 20 10C20 4.47715 15.5228 0 10 0C4.47715 0 0 4.47715 0 10C0 15.5228 4.47715 20 10 20Z" fill="#000"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M39.2333 10C39.2333 14.55 35.55 18.2333 31 18.2333C29.8094 18.2333 28.9202 17.7864 28.4755 17.2443C28.0308 16.7022 27.9057 15.8152 28.0588 14.5339L30.7088 14.0082C33.13 13.5647 34.4641 12.2176 34.9417 9.80288C35.0001 9.46485 35.0669 9.12682 35.1301 8.8064C35.156 8.67525 35.1813 8.54705 35.2052 8.42301C35.2774 8.03104 35.3471 7.65855 35.411 7.31691C35.4783 6.95699 35.5392 6.63132 35.5899 6.3532C35.861 4.78329 35.6407 3.62423 35.0309 2.81788C37.5398 4.22801 39.2333 6.91477 39.2333 10ZM31 1.76667C26.45 1.76667 22.7667 5.45 22.7667 10C22.7667 13.0852 24.4602 15.772 26.9691 17.1821C26.3593 16.3758 26.139 15.2167 26.4101 13.6468C26.4684 13.3273 26.538 12.9507 26.6158 12.5305C26.67 12.2378 26.7281 11.9239 26.7889 11.5934C26.8128 11.4694 26.8381 11.3412 26.864 11.21C26.9273 10.8896 26.994 10.5516 27.0524 10.2136C27.5136 7.78235 28.8477 6.43534 31.2688 5.99181L33.9412 5.46614C34.0943 4.18484 33.9692 3.29778 33.5245 2.75569C33.0798 2.2136 32.1906 1.76667 31 1.76667ZM41 10C41 15.5167 36.5167 20 31 20C25.4833 20 21 15.5167 21 10C21 4.48333 25.4833 0 31 0C36.5167 0 41 4.48333 41 10ZM33.6241 7.30597L31.6147 7.70022C29.9018 8.02876 29.1112 8.81726 28.7818 10.5257C28.7052 10.9076 28.6385 11.2698 28.5741 11.6199C28.5554 11.7215 28.5368 11.8222 28.5183 11.922C28.4689 12.1848 28.4195 12.4476 28.3701 12.694L30.363 12.2998C32.0759 11.9712 32.883 11.1827 33.2124 9.47434C33.2848 9.11359 33.3515 8.75192 33.4182 8.39024C33.485 8.02852 33.5517 7.6668 33.6241 7.30597Z" fill="#000"></path></svg></div><div class="CheckboxCaptcha-Alert"></div><div id="smartcaptcha-status" class="CheckboxCaptcha-Status visuallyhidden">SmartCaptcha нужна проверка пользователя</div></div></div></div><span class="Text Text_color_ghost Text_weight_regular Text_typography_control-xs">Если у вас возникли проблемы, пожалуйста, воспользуйтесь <a href="https://yandex.ru/support/smart-captcha?unique_key=b59b5b8b-18693794-bde13e08-fa6005ee#help" class="Link Link_view_default">формой обратной связи</a></span><input type="hidden" name="rdata"><input type="hidden" name="aesKey"><input type="hidden" name="signKey"><input type="hidden" name="pdata"><input type="hidden" name="tdata"></form></div></div></div><script>const button=document.getElementById("js-button");button.addEventListener("click",function n(t){window.__JS_BUTTON_CLICKED__=!0,this.removeEventListener("click",n,!1)},!1),window.onerror=function(n,t){0===t.indexOf(window.location.origin+"/captcha_smart.a737a5c9dbdd19f5b829.min.js")&&(button.type="submit",window.Ya&&window.Ya.Rum&&window.Ya.Rum.logEventString&&window.Ya.Rum.logEventString("js_fail_force_submit_type",n,{page:"checkbox"}))}</script> <script>window.__SSR_DATA__={url:"/ru/checkbox",invalid:"no",formAction:"/checkcaptcha?key=ba31914b-a8b2fce9-b32f7592-b47e4acf_2/1691264077/75f03b1df87dda711f569fd4cf565547_860666e4e4a55348614e8e7f35f587e9&mt=B423C0870716AF6A6E77FB04F53DD765351D2C43B048495DA0B4C74FCDCE937A90CA8D10039FD3899C617CBEBEFCAF94FF13E45CCC8CBF4EAC1690FA24DC10AF7B893F88B37722887EB0D5B4B34694650D26442DACBD8AE6433B972B7D340E679831354620E34A75403771AD&retpath=aHR0cHM6Ly95YS5ydS8__44b41823ed7277609fdcfb8c1d7ae104&u=b59b5b8b-18693794-bde13e08-fa6005ee&s=c496e37f568a3805bc884e169a9ef597",captchaKey:"ba31914b-a8b2fce9-b32f7592-b47e4acf_2/1691264077/75f03b1df87dda711f569fd4cf565547_860666e4e4a55348614e8e7f35f587e9",imageSrc:"",taskImageSrc:"",voiceSrc:"",introSrc:"",aesKey:"Nl6W3wfWJWiesgtmXdnp++TBJSt64x6Zz4qNupj4bWU=",aesSign:"1_1691264077_13177050415105062388_b6ba15a97f543e08766eae28d953eb55",reqId:"1691264077315087-18051645066217489064-balancer-l7leveler-kubr-yp-sas-73-BAL",uniqueKey:"b59b5b8b-18693794-bde13e08-fa6005ee",powPrefix:"743D313639313236343037373B703D62343933623063302D39343435656133392D34386530643835342D32663065336536323B633D31353B643D45334536453136383246323441394136413338374635384530343943364333303B",powComplexity:"15"}</script><script src="/captcha_smart_error.a737a5c9dbdd19f5b829.min.js?k=1688990308309" crossorigin=""></script><script src="https://yastatic.net/react/16.8.4/react-with-dom-and-polyfills.min.js" crossorigin=""></script><script src="/captcha_smart.a737a5c9dbdd19f5b829.min.js?k=1688990308309" crossorigin=""></script><script>!function(e,n,t,a,c){e.ym=e.ym||function(){(e.ym.a=e.ym.a||[]).push(arguments)},e.ym.l=+new Date,a=n.createElement(t),c=n.getElementsByTagName(t)[0],a.async=1,a.src="https://mc.yandex.ru/metrika/tag.js",c.parentNode.insertBefore(a,c)}(window,document,"script"),ym(10630330,"init",{clickmap:!0,trackLinks:!0,accurateTrackBounce:!0,webvisor:!0,ut:"noindex",params:{req_id:"1691264077315087-18051645066217489064-balancer-l7leveler-kubr-yp-sas-73-BAL",unique_key:"b59b5b8b-18693794-bde13e08-fa6005ee"}})</script><noscript><div><img src="https://mc.yandex.ru/watch/10630330?ut=noindex" style="position:absolute;left:-9999px" alt=""></div></noscript><div><img src="https://adfstat.yandex.ru/captcha?req_id=1691264077315087-18051645066217489064-balancer-l7leveler-kubr-yp-sas-73-BAL&unique_key=b59b5b8b-18693794-bde13e08-fa6005ee" style="position:absolute;left:-9999px" alt=""></div>

