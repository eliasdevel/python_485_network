#!/bin/bash

echo "[Unit]" > /etc/systemd/system/485_temperature.service
echo "Description=485 Service \n" >> /etc/systemd/system/485_temperature.service
echo "Wants=network.target \n" >> /etc/systemd/system/485_temperature.service
echo "After=network.target \n" >> /etc/systemd/system/485_temperature.service
echo "[Service]\n" >> /etc/systemd/system/485_temperature.service
echo "ExecStartPre=/bin/sleep 10\n" >> /etc/systemd/system/485_temperature.service
echo "ExecStart=/home/pi/python_485_network/run.py\n" >> /etc/systemd/system/485_temperature.service
echo "Restart=always\n" >> /etc/systemd/system/485_temperature.service
echo "[Install]" >> /etc/systemd/system/485_temperature.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/485_temperature.service

sudo systemctl enable 485_temperature.service

sudo systemctl status dummy.service