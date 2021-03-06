#!/bin/bash

echo "[Unit]" > /etc/systemd/system/485_temperature.service
echo "Description=485 Service" >> /etc/systemd/system/485_temperature.service
echo "Wants=network.target" >> /etc/systemd/system/485_temperature.service
echo "After=network.target" >> /etc/systemd/system/485_temperature.service
echo "[Service]" >> /etc/systemd/system/485_temperature.service
echo "Type=simple" >> /etc/systemd/system/485_temperature.service
echo "Restart=always" >> /etc/systemd/system/485_temperature.service
echo "RestartSec=3" >> /etc/systemd/system/485_temperature.service
echo "User=pi" >> /etc/systemd/system/485_temperature.service
echo "ExecStart=/usr/bin/env python /home/pi/python_485_network/485_service.py" >> /etc/systemd/system/485_temperature.service
echo "[Install]" >> /etc/systemd/system/485_temperature.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/485_temperature.service


sudo systemctl disable 485_temperature.service

sudo systemctl enable 485_temperature.service

sudo systemctl status 485_temperature.service