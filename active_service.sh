[Unit]
Description=485 Service
Wants=network.target
After=network.target

[Service]
ExecStartPre=/bin/sleep 10
ExecStart=/home/pi/python_485_network/run.py
Restart=always

[Install]
WantedBy=multi-user.target