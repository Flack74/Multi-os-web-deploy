#!/bin/bash

USR='devops'

for host in `cat remhosts`
do
	echo "########################################"
	echo "Connecting to $host"
	echo "Pushing Script to $host"
	scp multios_websetup.sh $USR@$host:/tmp/
	ssh $USR@$host sudo /tmp/multios_websetup.sh
	ssh $USR@$host sudo rm -rf /tmp/multios_websetup.sh
	echo "########################################"
	echo
done
