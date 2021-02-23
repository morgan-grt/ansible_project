#!/bin/bash

echo '' > ../../../.ssh/known_hosts

cd update_dockers_ips/

python3 update_interfaces.py
