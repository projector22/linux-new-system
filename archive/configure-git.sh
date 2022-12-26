#!/bin/bash

echo "Enter a Git global name"
read name
echo "Enter a Git global email account"
read mail

git config --global user.name "$name"
git config --global user.mail "$mail"

echo "Complete"