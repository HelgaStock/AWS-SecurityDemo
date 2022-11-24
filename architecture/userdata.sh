#!/bin/bash
echo "start install"
yum update -y
echo "install webserver"
yum install -y httpd
systemctl enable httpd
systemctl start httpd
echo '<html><h1>Hello From Your Web Server!</h1></html>' > /var/www/html/index.html