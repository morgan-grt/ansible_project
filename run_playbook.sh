#!/bin/bash

cd ansible/

if [ -z "$1" ]
	then
		echo "Missing parameter";
		echo "Select a parameter in the list below:";
		echo "";
		echo "-r : run the nodejs servers";
		echo "-d : deploy the nodejs servers";
		echo "-s : stop the nodejs servers";
		echo "-u : update the nodejs servers";
		echo "-c : delete the nodejs servers process";
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
	elif [[ "$1" == '-u' ]]
		then
			ansible-playbook update_nodejs.yml;
	elif [[ "$1" == '-c' ]]
		then
			ansible-playbook delete_process_nodejs.yml;
	else
		echo "Bad parameter";
		echo "Select a parameter in the list below:";
		echo "";
		echo "-r : run the nodejs servers";
		echo "-d : deploy the nodejs servers";
		echo "-s : stop the nodejs servers";
		echo "-u : update the nodejs servers";
		echo "-c : delete the nodejs servers process";
	fi
fi