#!/bin/bash

printf "%s " "Enter a Git global name"
read name
printf "\n%s " "Enter a Git global email account"
read mail

git config --global user.name "$name"
git config --global user.mail "$mail"

printf "\n%s\n" "Complete"
