#!/bin/bash



printHelp() {
	cat << EOF
	
Select a parameter in the list below:
	-i : ips update\n";
	/!\\ Important if there has been an update in gns3 project
	/!\\ execute before project start

	-r : run the nodejs servers
	-d : deploy the nodejs servers
	-s : stop the nodejs servers
	-u : update the nodejs servers
	-c : delete the nodejs servers process
	
Can run multiple parameters like : ./run.sh -ds or -d -s
Will deploy then stop the nodejs servers

EOF
}

callPlaybook() {
	cd ansible/
	echo -e "Parameter: $1\nAction: $3\n";
	ansible-playbook $2.yml;
	cd ..;
}


if [[ $1 == "" ]]; then
	echo "Missing parameter";
	printHelp;
	exit 0;
fi

while getopts "rsducih" option
do
	echo "--------------";
	case $option in
		r)
			callPlaybook $option "run_nodejs" "nodejs servers start";;
				
		s)
			callPlaybook $option "stop_nodejs" "nodejs servers stop";;
				
		d)	
			callPlaybook $option "deploy_nodejs" "nodejs servers deployment";;
				
		u)
			callPlaybook $option "update_nodejs" "index.html file update";;
				
		c)
			callPlaybook $option "delete_process_nodejs" "nodejs process cleaning";;
				
		i)
			echo -e "Parameter: $option\nAction: ips update\n";
			echo '' > ~/.ssh/known_hosts;
			cd update_dockers_ips/;
			python3 update_interfaces.py;
			cd ..;;
				
		h)
			echo -e "Parameter: $option\nAction: display help";
			printHelp;;
	esac
	echo "task done"
done

echo "all done";
exit 0;
