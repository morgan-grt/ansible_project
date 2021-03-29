from pathlib import Path
home = str(Path.home())

ansible_path = '..//ansible//'
ansible_host_file = ansible_path + 'ansible_hosts.cfg'

gns3_path = home + '//GNS3//'

gns3_project_path = 'projects//projet_annuel_ansible//'
gns3_docker_path = 'project-files//docker//'

gns3_total_path = gns3_path + gns3_project_path + gns3_docker_path

gns3_docker_interfaces_path = 'etc//network//interfaces'

ansible_hosts_template = 'ansible_hosts_template.cfg'
interfaces_template = 'interfaces_template.cfg'

default_ip = '10.0.1.1'
