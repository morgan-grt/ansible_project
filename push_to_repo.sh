#!/bin/bash

git add .

git commit -m "update repo"

if [[ -z "$1" ]]
	then
		git commit -m "update repo"
else
	echo $1
	git commit -m $1
fi

git push https://9cbef11163ae1108cbc9d2a3dd11a553a5954695@github.com/morgan-grt/ansible_project.git

#token 9cbef11163ae1108cbc9d2a3dd11a553a5954695
