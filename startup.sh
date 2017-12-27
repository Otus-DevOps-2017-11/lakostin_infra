#!/bin/bash

##Update APT
sudo apt update
##Install Ruby and Bundler
sudo apt install -y ruby-full ruby-bundler build-essential

##Add keys
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
##Add repo MongoDB
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
##Update index of available packages
sudo apt update
##Install package
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod

cd /home/appuser/
git clone https://github.com/Otus-DevOps-2017-11/reddit.git
##Install dependencies
cd reddit && bundle install

##Start server
puma -d
