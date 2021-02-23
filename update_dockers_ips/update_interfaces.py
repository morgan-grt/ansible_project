import config
import os

def read(path, name):
	return 0


def get_docker_number(path):
	number = (len(os.listdir(path)))
	dockerids = list()
	for dirname in os.listdir(path):
	  	dockerids.append(dirname)
	return number, dockerids


def generate_ip(number):
	default = config.default_ip
	ips = list()
	for num in range(1, number + 1):
		ips.append(default + str(num))
	return ips


def update_hosts_file(ips):
	template = open(config.ansible_hosts_template, 'r', encoding='utf8').read().splitlines()

	index_servers = 1

	for ip in ips:
		template.insert(index_servers, 'server' + str(index_servers) + ' ansible_host=' + str(ip))
		index_servers += 1

	file_write = open(config.ansible_host_file, 'w')

	for line in template:
		file_write.write(str(line) + '\n')


def update_interfaces_files(ips, dockerids):
	template = open(config.interfaces_template, 'r', encoding='utf8').read().splitlines()

	index_address = 8

	for index in range(0, len(ips)):
		template_copy = template.copy()
		template_copy[index_address] = 'address ' + str(ips[index])

		path = config.gns3_total_path + dockerids[index] + '//' + config.gns3_docker_interfaces_path

		file_write = open(path, 'w')

		for line in template_copy:
			file_write.write(str(line) + '\n')


def main():
	number, dockerids = get_docker_number(config.gns3_total_path)

	ips = generate_ip(number)

	update_hosts_file(ips)

	update_interfaces_files(ips, dockerids)


if __name__ == '__main__':
    main()