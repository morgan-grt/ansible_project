#!/bin/bash

git add .

if [[ -z "$1" ]]
	then
		git commit -m "update repo"
else
	echo $1
	git commit -m "$1"
fi

git push https://github.com/morgan-grt/ansible_project.git

#token 9cbef11163ae1108cbc9d2a3dd11a553a5954695
