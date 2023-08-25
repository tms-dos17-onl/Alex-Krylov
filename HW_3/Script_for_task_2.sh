#!/bin/bash
sudo useradd -m user_with_group4
sudo touch user_with_group4 h
sudo chmod 777 /home/user_with_group4/h
sudo chmod 777 /home/user_with_group4
sudo lshw -class processor tree -a /home/user_with_group4/h >> sudo | echo ----- >> /home/user_with_group4/h
sudo free tree -a /home/user_with_group4/h >> sudo | echo ------ >> /home/user_with_group4/h
sudo ls -l /boot tree -a /home/user_with_group4/h >> sudo | echo ----- >> /home/user_with_group4/h
sudo lsblk tree -a /home/user_with_group4/h >> sudo | echo ------- >> /home/user_with_group4/h
