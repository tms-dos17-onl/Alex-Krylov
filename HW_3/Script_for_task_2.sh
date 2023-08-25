#!/bin/bash
sudo useradd -m user_with_group4
sudo touch user_with_group4 h
sudo chmod 777 /home/user_with_group4/h
sudo chmod 777 /home/user_with_group4
sudo tree -a lshw -class processor >> /home/user_with_group4/h | echo ----- >> /home/user_with_group4/h
sudo tree -a free >> /home/user_with_group4/h | echo ------ >> /home/user_with_group4/h
sudo tree -a ls -l /boot >> /home/user_with_group4/h | echo ----- >> /home/user_with_group4/h
sudo tree -a lsblk >> /home/user_with_group4/h | echo ------- >> /home/user_with_group4/h
