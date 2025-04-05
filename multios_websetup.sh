#!/bin/bash

# Variable Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2137_barista_cafe.zip"
ART_NAME="2137_barista_cafe"
TEMDIR="/tmp/webfiles"

yum --help &> /dev/null

if [ $? -eq 0 ]
then
	echo"Running Setup on CentOS"

	# Installing Dependencies
	echo "##################################"
	echo "Installing required packages: wget, unzip, and httpd."
	echo "##################################"
	sudo yum install $PACKAGE -y
	echo 

	# Start & Enable HTTPD Service
	echo "##################################"
	echo "Starting and enabling the Apache HTTPD service."
	echo "##################################"
	sudo systemctl start $SVC   # Start the Apache HTTPD service
	sudo systemctl enable $SVC  # Enable HTTPD to start on boot
	echo 

	# Creating a temporary directory for web files
	sudo mkdir -p $TEMDIR
	cd $TEMDIR 

	# Downloading the website template
	echo "##################################"
	echo "Downloading the website template."
	echo "##################################"
	wget $URL

	# Unzipping the downloaded template
	echo "##################################"
	echo "Extracting the website template."
	echo "##################################"
	sudo unzip $ART_NAME.zip

	# Copying website files to the Apache root directory
	echo "##################################"
	echo "Deploying website to /var/www/html/."
	echo "##################################"
	sudo cp -r $ART_NAME/* /var/www/html/

	# Restarting HTTPD service to apply changes
	echo "##################################"
	echo "Restarting Apache HTTPD service."
	echo "##################################"
	sudo systemctl restart $SVC

	# Cleaning up temporary files
	echo "##################################"
	echo "Removing temporary files."
	echo "##################################"
	sudo rm -rf $TEMDIR
	echo 

	sudo systemctl status $SVC
	ls /var/www/html/
	echo "##################################"
	echo "Deployment completed successfully!"
	echo "##################################"

else
	echo "Running Setup on Ubuntu"
	
	# Set Variable for Ubuntu 
	PACKAGE="apache2 wget unzip"
	SVC="apache2"

	# Installing Dependencies
	echo "##################################"
	echo "Installing required packages: wget, unzip, and httpd."
	echo "##################################"
	sudo apt update
	sudo apt install $PACKAGE -y > /dev/null
	echo 

	# Start & Enable Apache Service
	echo "##################################"
	echo "Starting and enabling the Apache HTTPD service."
	echo "##################################"
	sudo systemctl start $SVC   # Start the Apache HTTPD service
	sudo systemctl enable $SVC  # Enable HTTPD to start on boot
	echo 

	# Creating a temporary directory for web files
	sudo mkdir -p $TEMDIR
	cd $TEMDIR 

	# Downloading the website template
	echo "##################################"
	echo "Downloading the website template."
	echo "##################################"
	wget $URL

	# Unzipping the downloaded template
	echo "##################################"
	echo "Extracting the website template."
	echo "##################################"
	sudo unzip $ART_NAME.zip

	# Copying website files to the Apache root directory
	echo "##################################"
	echo "Deploying website to /var/www/html/."
	echo "##################################"
	sudo cp -r $ART_NAME/* /var/www/html/

	# Restarting HTTPD service to apply changes
	echo "##################################"
	echo "Restarting Apache HTTPD service."
	echo "##################################"
	sudo systemctl restart $SVC

	# Cleaning up temporary files
	echo "##################################"
	echo "Removing temporary files."
	echo "##################################"
	sudo rm -rf $TEMDIR
	echo 

	sudo systemctl status $SVC
	ls /var/www/html/
	echo "##################################"
	echo "Deployment completed successfully!"
	echo "##################################"
fi	
