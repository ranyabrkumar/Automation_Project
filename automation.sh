#!/bin/bash
#Perform an update of the package details and the package list at the start of the script.
sudo apt update -y
#Install the apache2 package .
sudo apt install -y apache2
sudo systemctl start apache2
#Ensure that the apache2 service is enabled. 
sudo systemctl enable apache2
cd /var/log/apache2
#Create a tar archive of apache2 access logs and error logs that are present in the /var/log/apache2/ directory and place the tar into the /tmp/ directory
tar -cf archive.tar access.log error.log
cp archive.tar ./tmp
tar -cf archive.tar access.log error.log
#Create a tar of only the .log files (for example access.log) and not any other file type (For example: .zip and .tar) that are already present in the /var/log/apache2/ directory. 
#The name of tar archive should have following format:  <your _name>-httpd-logs-<timestamp>.tar
cd tmp
timestamp="$(date +"%d%m%Y-%H%M%S")"
myname=Ranya
s3_bucket=upgrade-ranya1
 tar -cf $myname-httpd-logs-$timestamp.tar *.log
 ls
 cd ..
 aws s3 \
cp ./tmp/${myname}-httpd-logs-${timestamp}.tar \
s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar


