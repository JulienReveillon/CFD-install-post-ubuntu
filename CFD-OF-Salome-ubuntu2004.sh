#!/bin/bash
#------------------------------
#-  Julien Reveillon ----------
#-  Julien.Reveillon@coria.fr -
#-  21/12/2020 ----------------
#
#------------------------------
# Script to install basic CFD  tools
#------------------------------
#
# README : after charging for the first time your OF
#          environment (oforg or ofcom) create your run directory.
#          type in the terminal :
#          mkdir -p $FOAM_RUN
#
#------------------------------
offondation="on"
olaflow="on" #olaflow is installed only with the fondation version
ofESI="off"
salome="on"

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
# update system
sudo apt-get update
sudo apt upgrade -y
# version control
apt_install git
# system
apt_install aptitude
apt_install curl
apt_install tree
apt_install meld
# Python3
apt_install python3-pip
apt_install python3-opengl
sudo -H pip3 install --upgrade pip
# Python libraries
pip_install testresources
pip_install setuptools
pip_install seaborn
pip_install pygame
pip_install scipy
pip_install matplotlib
pip_install numpy
pip_install sympy
pip_install PyFoam
# CAD
apt_install meshlab
apt_install freecad


# OPENFOAM OpenFoam fondation package
if [ $offondation = "on" ]; then
    echo "--------------------------------------------"
    echo "----     Install : OpenFoam Fondation"
    echo "--------------------------------------------"
    echo "Install openFoam foundation package !"
    sudo sh -c "wget -O - https://dl.openfoam.org/gpg.key | apt-key add -"
    sudo add-apt-repository http://dl.openfoam.org/ubuntu
    sudo apt-get update
    apt_install openfoam8
    if [ $ofESI != "on" ]; then
       echo ". /opt/openfoam8/etc/bashrc" >> ~/.bashrc
    else
       echo "alias oforg='. /opt/openfoam8/etc/bashrc'" >> ~/.bashrc
    fi
    . /opt/openfoam8/etc/bashrc
    mkdir -p "$FOAM_RUN"
    #### option suggested non necessary packages  : begin comment
    sudo apt-get -y install bison flex-doc gnuplot-doc libboost-doc libboost1.71-doc libboost-container1.71-dev libboost-context1.71-dev libboost-contract1.71 dev libboost-coroutine1.71-dev libboost-exception1.71-dev libboost-fiber1.71-dev libboost-filesystem1.71-dev libboost-graph1.71-dev libboost-graph-parallel1.71-dev libboost-iostreams1.71-dev libboost-locale1.71-dev libboost-log1.71-dev libboost-math1.71-dev libboost-mpi1.71-dev libboost-mpi-python1.71-dev libboost-numpy1.71-dev libboost-python1.71-dev libboost-random1.71-dev libboost-regex1.71-dev libboost-stacktrace1.71-dev libboost-test1.71-dev libboost-timer1.71-dev libboost-type-erasure1.71-dev libboost-wave1.71-dev libboost1.71-tools-dev libmpfrc++-dev libntl-dev libmpfi-dev gmp-doc libgmp10-doc libice-doc libmpfr-doc ncurses-doc readline-doc libsm-doc libx11-doc libxcb-doc libxext-doc libxt-doc python2-doc python-tk python2.7-doc binfmt-support qt5-doc default-libmysqlclient-dev firebird-dev libpq-dev libsqlite3-dev unixodbc-dev
    #### option suggested non necessary packages : end comment
    #olaflow (wave generation library)
    if [ $olaflow = "on" ]; then
       echo "--------------------------------------------"
       echo "----     Install : olaflow"
       echo "--------------------------------------------"
       cd ~
       git clone git://github.com/phicau/olaFlow.git
       cd olaFlow
       ./allMake
       cd ~
    else
       echo "--------------------------------------------"
       echo "----     NO install : olaflow"
       echo "--------------------------------------------"
    fi
else
    echo "--------------------------------------------"
    echo "----     NO install : OpenFoam Fondation"
    echo "--------------------------------------------"
fi
### OpenFoam - End Fondation package

# OPENFOAM OpenFoam ESI package
# /usr/lib/openfoam/openfoam2012 sources & co
# /usr/bin/openfoam2012 : bash session location
if [ $ofESI = "on" ]; then
    echo "--------------------------------------------"
    echo "----     Install : OpenFoam - ESI"
    echo "--------------------------------------------"
    curl -s https://dl.openfoam.com/add-debian-repo.sh -o add-debian-repo.sh
    sudo bash add-debian-repo.sh
    sudo rm -f add-debian-repo.sh
    sudo apt-get update
    apt_install openfoam2012-default
    if [ $offondation != "on" ]; then
       echo ". /usr/lib/openfoam/openfoam2012/etc/bashrc" >> ~/.bashrc
    else
       echo "alias ofcom='. /usr/lib/openfoam/openfoam2012/etc/bashrc'" >> ~/.bashrc
    fi
    . /usr/lib/openfoam/openfoam2012/etc/bashrc
    mkdir -p "$FOAM_RUN"
else
    echo "--------------------------------------------"
    echo "----     NO install : OpenFoam - ESI"
    echo "--------------------------------------------"
fi
### OpenFoam - End ESI package



#### SALOME Mesh
if [ $salome = "on" ]; then
    echo "--------------------------------------------"
    echo "----     Install : salome"
    echo "--------------------------------------------"
    # necessary library
    apt_install libtbb-dev
    # download salome
    wget -O salome_dist.tar.gz "https://www.salome-platform.org/downloads/current-version/DownloadDistr?platform=SP.UB20.04&version=9.6.0"
    if [ $? -eq 0 ]; then
        tar -xzf salome_dist.tar.gz
        if [ $? -eq 0 ]; then
            echo "alias salome='~/SALOME-9.6.0-UB20.04-SRC/salome'" >> ~/.bashrc
            rm -rf salome_dist.tar.gz
        else
            echo "could not uncompress SALOME"
        fi
    else
        echo "could not install SALOME"
    fi
else
    echo "--------------------------------------------"
    echo "----     NO install : salome"
    echo "--------------------------------------------"
fi
# personnal setup
echo "alias h='history'" >> ~/.bashrc
# clean
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get -y autoremove

# SUPRESS REPORT ERROR MESSAGES
sudo rm -v /var/crash/*
sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport
sudo systemctl disable apport.service

echo "Done !"
