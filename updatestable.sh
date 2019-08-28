#!/bin/bash

cd ~/lourie-registration-system

git checkout master
git fetch -p origin
git pull
git checkout stable
git merge master
git push origin stable
