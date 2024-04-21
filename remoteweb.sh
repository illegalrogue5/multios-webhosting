#!/bin/bash

USR="devops"

for host in `cat hosts` 
do 
echo
echo "###########################################"
echo "Connecting to host $host"
echo "Copying script to host $host"
scp multiwebsetup.sh $USR@$host:/tmp/
echo "Preparing to execute the script on $host"
ssh $USR@$host sudo /tmp/multiwebsetup.sh
ssh $USR@$host sudo rm -rf /tmp/multiwebsetup.sh
echo "############################################"
echo
done
