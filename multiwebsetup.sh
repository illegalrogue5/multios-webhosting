#!/bin/bash

#PACKAGE="wget httpd unzip"
#SVC="httpd"
#TMPDIR="/tmp/websetup/"
#URL="https://www.tooplate.com/zip-templates/2132_clean_work.zip"
#FILE="2132_clean_work"

yum --help > /dev/null

if [ $? -eq 0 ]

then

PACKAGE="wget httpd unzip"
SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2132_clean_work.zip"
#FILE="2132_clean_work"
TMPDIR="/tmp/websetup/"

echo "Installing pre-requisites on centOs7"

sudo yum install $PACKAGE -y > /dev/null

echo "Starting services - HTTPD"

systemctl start $SVC

echo "Enabling services - HTTPD"

systemctl enable $SVC

mkdir $TMPDIR

echo "Getting package from tooplate.com"

cd $TMPDIR
 
wget -q $URL > /dev/null

echo "Unzipping Package"

unzip 2132_clean_work.zip > /dev/null

echo "Copying the files to direcory /var/www/html"

cp -R -p 2132_clean_work/* /var/www/html > /dev/null

echo "Restarting service - HTTPD"

systemctl restart $SVC

systemctl status $SVC

echo "Performing clean up"

cd /tmp/websetup/ && rm -Rf /tmp/websetup

else

PACKAGE="wget apache2 unzip"
SVC="apache2"
URL="https://www.tooplate.com/zip-templates/2132_clean_work.zip"
#FILE="2132_clean_work"
TMPDIR="/tmp/websetup/"

echo "Installing pre-requisites on Ubuntu"

sudo apt install $PACKAGE -y > /dev/null

echo "Starting services - Apache2"

systemctl start $SVC

echo "Enabling services - Apache2"

systemctl enable $SVC

mkdir $TMPDIR

echo "Getting package from tooplate.com"

cd $TMPDIR

wget -q $URL > /dev/null

echo "Unzipping Package"

unzip 2132_clean_work.zip > /dev/null

echo "Copying the files to direcory /var/www/html"

cp -R -p 2132_clean_work/* /var/www/html > /dev/null

echo "Restarting service - HTTPD"

systemctl restart $SVC

systemctl status $SVC

echo "Performing clean up"

cd $TMPDIR 
rm -Rf $TMPDIR
fi
