#!/bin/bash
sudo yum install -y httpd
sudo yum install -y telnet
sudo echo "packer demo" > /var/www/html/index.html
sudo systemctl enable httpd
