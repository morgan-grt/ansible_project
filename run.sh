#!/bin/bash

cd ansible/

message="Select a parameter in the list below:\n";
message+="\t-i : ips update\n";
message+="\t/!\\ Important if there has been an update in gns3 project\n";
message+="\t/!\\ execute before project start\n\n";
message+="\t-r : run the nodejs servers\n";
message+="\t-d : deploy the nodejs servers\n";
message+="\t-s : stop the nodejs servers\n";
message+="\t-u : update the nodejs servers\n";
message+="\t-c : delete the nodejs servers process";

if [ -z "$1" ]
	then
		echo "Missing parameter";
		echo -e "${message}";
else

	if [[ "$1" == '-r' ]]
		then
			echo -e "Parameter: $1\nAction: nodejs servers start\n";
			ansible-playbook run_nodejs.yml;
			
	elif [[ "$1" == '-s' ]]
		then
			echo -e "Parameter: $1\nAction: nodejs servers stop\n";
			ansible-playbook stop_nodejs.yml;
			
	elif [[ "$1" == '-d' ]]
		then
			echo -e "Parameter: $1\nAction: nodejs servers deployment\n";
			ansible-playbook deploy_nodejs.yml;
			
	elif [[ "$1" == '-u' ]]
		then
			echo -e "Parameter: $1\nAction: index.html file update\n";
			ansible-playbook update_nodejs.yml;
			
	elif [[ "$1" == '-c' ]]
		then
			echo -e "Parameter: $1\nAction: nodejs process cleaning\n";
			ansible-playbook delete_process_nodejs.yml;
			
	elif [[ "$1" == '-i' ]]
		then
			echo -e "Parameter: $1\nAction: ips update\n";
			echo '' > ~/.ssh/known_hosts;
			cd ../update_dockers_ips/;
			python3 update_interfaces.py;
			
	else
		echo "Bad parameter";
		echo -e "${message}";
	fi
fi

echo "done";
