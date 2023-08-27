#!/bin/bash
sudo useradd -m user_with_group4
sudo touch user_with_group4 h
sudo chmod 777 /home/user_with_group4/h
sudo chmod 777 /home/user_with_group4
sudo lshw -class processor | tee -a /home/user_with_group4/h
sudo free | tee -a /home/user_with_group4/h | sudo echo ------ | tee -a /home/user_with_group4/h
sudo ls -l /boot tee -a /home/user_with_group4/h | echo ----- tee -a /home/user_with_group4/h
sudo lsblk tee -a /home/user_with_group4/h | echo ------- tee -a /home/user_with_group4/h
