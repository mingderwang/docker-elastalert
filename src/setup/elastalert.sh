#!/bin/bash

# misc
apt-get update
apt purge libpython2*
apt install python
apt-get install python python-pip -y
pip install python-pip -y
apt-get install git wget build-essential python-dev libffi-dev libssl-dev -y
apt-get install python3-dev -y
wget https://bootstrap.pypa.io/ez_setup.py -O - | python
pip install --upgrade pip
pip install --upgrade six
echo "------------------------------"
# nodejs
export PYTHON=python2.7
apt-get update -y
apt-get install -y build-essential curl
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt-get install -y nodejs

#elastalert
git clone https://github.com/Yelp/elastalert.git /elastalert
git checkout tags/v0.2.4
cd /elastalert
python setup.py install
pip install -r requirements.txt
pip install pytz
pip install tzlocal
pip install futures
pip install funcsigs
pip install croniter
pip install elasticsearch
pip install kibana
pip install natsort
pip install blist
pip list
cp -f config.yaml.example /.backup/elastalert.yml

# purge
#apt-get remove git wget build-essential python-pip python-dev -y
