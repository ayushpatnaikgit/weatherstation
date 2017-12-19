#!/bin/bash
echo "The user is required"
echo "updating"
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git build-essential python-dev python-smbus 
echo "Downloading Packages"
git clone https://github.com/adafruit/DHT-sensor-library
git clone https://github.com/adafruit/Adafruit_Python_BMP
git clone https://github.com/pyserial/pyserial
cd pyserial
sudo python setup.py install
cd ..
cd Adafruit_Python_BMP
sudo python setup.py install
cd ..
cd DHT-sensor-library
sudo python setup.py install
cd ..
echo "Setting up crontab "
crontab -l > mycron
echo "*/10 * * * * sudo /usr/bin/python /home/pi/Progrmas_final/cron.py >/dev/null 2>&1" >>mycron
crontab mycron
rm mycron
sudo apt-get install python-pip python-dev
sudo pip install RPi.GPIO  
wget https://www.dropbox.com/s/9fni8q2ua10esm1/Progrmas_final.zip?dl=0 -O programs.zip
unzip programs.zip
rm -rf program.zip

