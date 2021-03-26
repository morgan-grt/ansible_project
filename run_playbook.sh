#!/bin/bash

cd ansible/

if [ -z "$1" ]
	then
		ansible-playbook deploy_nodejs.yml;
else
	echo $1
	if [[ "$1" == '-r' ]]
		then
			ansible-playbook run_nodejs.yml;
	elif [[ "$1" == '-s' ]]
		then
			ansible-playbook stop_nodejs.yml;
	elif [[ "$1" == '-d' ]]
		then
			ansible-playbook deploy_nodejs.yml;
	else
		echo "Bad parameter";
		echo "-r : run the nodejs servers";
		echo "-d : deploy the nodejs servers";
		echo "-s : stop the nodejs servers";
	fi
fi