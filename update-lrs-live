#!/bin/bash

cd ~/lourie-registration-system

git checkout master
git pull
git checkout prod-dist
git merge master
git push origin prod-dist
git rev-parse --short HEAD
