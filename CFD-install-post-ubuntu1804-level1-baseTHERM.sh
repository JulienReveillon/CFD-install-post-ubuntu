#!/bin/bash
#------------------------------
#-  Julien Reveillon ----------
#-  Julien.Reveillon@coria.fr -
#-  24/10/2020 ----------------
#------------------------------
# Script to install basic CFD tools
# Ubuntu 18.04
#------------------------------
# Stages :
# 1/ Install Ubuntu 18.04
# 2/ Be sure that you uptated your Ubuntu installation
# 3/ Install wget (it is already done by default generally) :
#    > sudo apt install wget
# 4/ Download the script :
#    > wget xxx
# 4/ execute the script :
#    > bash CFD-install-post-ubuntu1804-level1-baseCFD.sh > log.baseCFD
#    warning : it will ask you for the sudo passwd several time, enter it.
#    but do no sudo the whole script otherwise you will have owner/group problems
# 5/
# 8/ Restart ubuntu
#

set -x  # make sure each command is printed

function apt_install {
  sudo apt-get -y install $1
  if [ $? -ne 0 ]; then
    echo "could not install $1 - abort"
    exit 1
  fi
}

function pip_install {
  sudo -H pip3 install --upgrade "$@"
  if [ $? -ne 0 ]; then
    echo "could not install $p - abort"
    exit 1
  fi
}


# user root
cd ~
# upgrade system
sudo apt-get update
sudo apt upgrade -y
# version control
apt_install git
# Python3
apt_install python3-pip
apt_install python3-opengl
sudo -H pip3 install --upgrade pip
# Python libraries
pip_install setuptools
pip_install seaborn
pip_install pygame
pip_install scipy
pip_install matplotlib
pip_install numpy
pip_install sympy

# Cantera

### cantera
sudo aptitude install python-software-properties
sudo apt-add-repository ppa:speth/cantera
sudo aptitude update
sudo aptitude install cantera-python cantera-python3 cantera-dev




# THE END
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get -y autoremove
echo "Done !"
