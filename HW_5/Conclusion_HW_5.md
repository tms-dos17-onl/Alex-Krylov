1--------

Я использую модель OSI

Physical layer

Data link layer

Network layer      ISMP

Transport layer        Udp,Tcp

Session layer

Presentation layer

Application layer    HTTP,FTP,RTP,DNS,SSH,NTP
2------

al@al-VirtualBox:~$ sudo ss -tnlupao
Netid    State      Recv-Q     Send-Q                  Local Address:Port                     Peer Address:Port     Process                                                                                                             
udp      UNCONN     0          0                          127.0.0.54:53                            0.0.0.0:*         users:(("systemd-resolve",pid=594,fd=15))                                                                          
udp      UNCONN     0          0                       127.0.0.53%lo:53                            0.0.0.0:*         users:(("systemd-resolve",pid=594,fd=13))                                                                          
udp      ESTAB      0          0                172.17.247.38%enp0s3:68                       172.17.240.1:67        users:(("NetworkManager",pid=716,fd=26))                                                                           
udp      UNCONN     0          0                             0.0.0.0:49319                         0.0.0.0:*         users:(("avahi-daemon",pid=633,fd=14))                                                                             
udp      UNCONN     0          0                           127.0.0.1:323                           0.0.0.0:*         users:(("chronyd",pid=778,fd=5))                                                                                   
udp      UNCONN     0          0                             0.0.0.0:5353                          0.0.0.0:*         users:(("avahi-daemon",pid=633,fd=12))                                                                             
udp      UNCONN     0          0                                [::]:49138                            [::]:*         users:(("avahi-daemon",pid=633,fd=15))                                                                             
udp      UNCONN     0          0                               [::1]:323                              [::]:*         users:(("chronyd",pid=778,fd=6))                                                                                   
udp      UNCONN     0          0                                [::]:5353                             [::]:*         users:(("avahi-daemon",pid=633,fd=13))                                                                             
tcp      LISTEN     0          4096                    127.0.0.53%lo:53                            0.0.0.0:*         users:(("systemd-resolve",pid=594,fd=14))                                                                          
tcp      LISTEN     0          4096                       127.0.0.54:53                            0.0.0.0:*         users:(("systemd-resolve",pid=594,fd=16))                                                                          
tcp      LISTEN     0          128                         127.0.0.1:631                           0.0.0.0:*         users:(("cupsd",pid=753,fd=7))                                                                                     
tcp      LISTEN     0          4096                                *:22                                  *:*         users:(("sshd",pid=1898,fd=3),("systemd",pid=1,fd=68))                                                             
tcp      LISTEN     0          128                             [::1]:631                              [::]:*         users:(("cupsd",pid=753,fd=6))                                                                                     
tcp      ESTAB      0          0              [::ffff:172.17.247.38]:22            [::ffff:172.17.251.104]:50958     users:(("sshd",pid=2313,fd=4),("sshd",pid=2277,fd=4)) timer:(keepalive,118min,0)  ////Вот мое соединение между Виртуалками
