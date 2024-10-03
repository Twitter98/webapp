#!/bin/bash
#scriptname:Tomcat-install.sh
#Author: Onu Maduabuchi
#steps for installing tomcat on rhel7&8
#install java JDK 1.8 + as a prerequisite for tomcat server to run
sudo hostnamectl set-hostname tomcat-server
cd /opt
sudo yum install git nano tree vim wget  -y
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y

#Download tomcat software and extract  it
#Extract tomcat files using tar commond in -xvf mode
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.95/bin/apache-tomcat-9.0.95.tar.gz
sudo tar -xvf apache-tomcat-9.0.95.tar.gz
sudo rm apache-tomcat-9.0.95.tar.gz
sudo mv apache-tomcat-9.0.95 apache9
sudo chmod 777 -R /opt/tomcat9
sudo sh /opt/tomcat9/bin/startup.sh
#create a soft link to start and stop tomcat from anywhere
#to manage tomcat as a service
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/shutdowntomcat
sudo starttomcat
echo “echo on tomcat installation”
