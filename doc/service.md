# 注册 服务 

sudo vim /lib/systemd/system/zkp.service


```

[Unit]
Description=Test Service
After=multi-user.target
 
[Service]
Type=idle
ExecStart=/usr/bin/python3 /home/zcore/start.py
 
[Install]
WantedBy=multi-user.target

```

sudo systemctl daemon-reload

显示所有已启动的服务  
systemctl list-units --type=service

systemctl start   
systemctl restart


systemctl enable  
systemctl disable


systemctl status