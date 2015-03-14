#!/bin/bash
# Simple setup.sh for configuring Ubuntu EC2 instance
# for headless setup. 

# Install basics

sudo apt-get install -y git
sudo apt-get install -y python-pip
sudo apt-get install -y python-dev
sudo apt-get install -y ipython
sudo apt-get install -y unzip
sudo apt-get install -y zlibc zlib1g zlib1g-dev
sudo apt-get install -y lynx
sudo apt-get install -y libjpeg-dev

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

git clone https://github.com/chepyle/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sf dotfiles/.emacs.d .

git clone https://github.com/chepyle/datascience-bowl

#http://tleyden.github.io/blog/2014/10/25/cuda-6-dot-5-on-aws-gpu-instance-running-ubuntu-14-dot-04/
# update NVIDIA driver
wget http://us.download.nvidia.com/XFree86/Linux-x86_64/346.47/NVIDIA-Linux-x86_64-346.47.run

sudo apt-get install -y linux-image-extra-virtual

echo options nouveau modeset=0 | sudo tee -a /etc/modprobe.d/nouveau-kms.conf

sudo update-initramfs -u

sudo apt-get install -y linux-source
sudo apt-get install -y linux-headers-3.13.0-46-generic # use `uname -r` to get version

sudo bash NVIDIA-Linux-x86_64-346.47.run

#

cd datascience-bowl

sudo pip install -r requirements-gpu.pip

# must get graph create key from dato.com

# will have to get the data manually using lynx... remove these lines
#wget https://www.kaggle.com/c/datasciencebowl/download/train.zip
#wget https://www.kaggle.com/c/datasciencebowl/download/test.zip
#unzip train.zip
#unzip test.zip



#python make_submission.py
