#!/bin/bash
#------------------------------
#-  Julien Reveillon          -
#-  Julien.Reveillon@coria.fr -
#-  24/10/2020                -
#------------------------------
# Script to install basic CFD tools
# Ubuntu 18.04
# PLeas Execute :
# CFD-install-post-ubuntu1804-level1-baseCFD.sh before
#------------------------------

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
# CAD
apt_install meshlab
apt_install freecad

# OPENFOAM

# OpenFoam fondation package
echo "OpenFoam foundation package !"
sudo sh -c "wget -O - https://dl.openfoam.org/gpg.key | apt-key add -"
sudo add-apt-repository http://dl.openfoam.org/ubuntu
sudo apt-get update
sudo apt-get -y install openfoam8
echo ". /opt/openfoam8/etc/bashrc" >> ~/.bashrc
. /opt/openfoam8/etc/bashrc
mkdir -p "$FOAM_RUN"

#olaflow (wave generation library)
cd ~
git clone git://github.com/phicau/olaFlow.git
cd olaFlow
./allMake
cd ~

### SALOME Mesh
wget -O salome_dist.tar.gz "https://www.salome-platform.org/downloads/previous-versions/salome-v9.3/DownloadDistr?platform=OS1.UB18.04&version=9.3.0"
if [ $? -eq 0 ]; then
    tar -xzf salome_dist.tar.gz
    if [ $? -eq 0 ]; then
      echo "alias salome='~/SALOME-9.3.0-UB18.04-SRC/salome'" >> ~/.bashrc
      rm -rf salome_dist.tar.gz
    else
      echo "could not uncompress SALOME"
    fi
else
    echo "could not install SALOME"
fi


# THE END
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get -y autoremove
echo "Done !"
