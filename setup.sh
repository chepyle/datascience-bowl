#!/bin/bash
# Simple setup.sh for configuring Ubuntu EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y python-pip
sudo apt-get install -y ipython

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

git clone https://github.com/chepyle/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sf dotfiles/.emacs.d .

git clone https://github.com/chepyle/datascience-bowl

cd datascience-bowl
wget https://www.kaggle.com/c/datasciencebowl/download/train.zip
wget https://www.kaggle.com/c/datasciencebowl/download/test.zip
unzip train.zip
unzip test.zip
pip install -r requirements.pip
pip install -r requirements-gpu.pip

python make_submission.py
