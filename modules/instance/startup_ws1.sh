#!/bin/bash
    yum -y install httpd
    echo "<html><body bgcolor=black><center><h1><p><font color=red>Web Server-1</h1></center></body></html>" > /var/www/html/index.html
    timedatectl set-timezone  Europe/Moscow
    systemctl start httpd 
    systemctl enable httpd 
    echo test of user_data | sudo tee /tmp/user_data.log
    curl http://169.254.169.254/latest/meta-data/local-ipv4 | sudo tee -a /tmp/user_data.log
