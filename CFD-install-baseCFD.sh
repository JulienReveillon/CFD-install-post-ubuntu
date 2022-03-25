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
ofESI="on"
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
  pip3 install --upgrade "$@"
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
apt_install gnuplot
# Python3
apt_install python3-pip
apt_install python3-opengl
apt_install python3-psutil
apt_install python3-sip
apt_install python3-pyqt5
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
# python env
apt_install spyder
# cantera library
sudo apt install software-properties-common
sudo apt-add-repository ppa:cantera-team/cantera
sudo apt install cantera-python3 cantera-dev
# CAD
apt_install meshlab
apt_install freecad
# SALOME PART 1
apt_install libtbb-dev 
##apt install libqwt-qt5-dev 
apt_install libqwt-qt5-6
apt_install libqt5test5

# OPENFOAM OpenFoam fondation package
if [ $offondation = "on" ]; then
    echo "--------------------------------------------"
    echo "----     Install : OpenFoam Fondation"
    echo "--------------------------------------------"
    echo "Install openFoam foundation package !"
    sudo sh -c "wget -O - https://dl.openfoam.org/gpg.key | apt-key add -"
    sudo add-apt-repository http://dl.openfoam.org/ubuntu
    sudo apt-get update
    apt_install openfoam9
    if [ $ofESI != "on" ]; then
       echo ". /opt/openfoam9/etc/bashrc" >> ~/.bashrc
    else
       echo "function oforg() {" >> ~/.bashrc
       echo "   . /opt/openfoam9/etc/bashrc" >> ~/.bashrc
       echo "   . \$WM_PROJECT_DIR/bin/tools/CleanFunctions" >> ~/.bashrc
       echo "   export PS1=\"\u@OF90 \w> \"" >> ~/.bashrc
       echo "}" >> ~/.bashrc
    fi
    . /opt/openfoam9/etc/bashrc
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
if [ $ofESI = "on" ]; then
    echo "--------------------------------------------"
    echo "----     Install : OpenFoam - ESI"
    echo "--------------------------------------------"
    apt_install paraview
    curl -s https://dl.openfoam.com/add-debian-repo.sh -o add-debian-repo.sh
    sudo bash add-debian-repo.sh
    sudo rm -f add-debian-repo.sh
    sudo apt-get update
    apt_install openfoam2112-default
    if [ $offondation != "on" ]; then
       echo ". /usr/lib/openfoam/openfoam2112/etc/bashrc" >> ~/.bashrc
    else
       echo "function ofcom() {" >> ~/.bashrc
       echo "   . /usr/lib/openfoam/openfoam2112/etc/bashrc" >> ~/.bashrc
       echo "   . \$WM_PROJECT_DIR/bin/tools/CleanFunctions" >> ~/.bashrc
       echo "   export PS1=\"\u@OF2112 \w> \"" >> ~/.bashrc
       echo "}" >> ~/.bashrc
    fi
    . /usr/lib/openfoam/openfoam2112/etc/bashrc
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
    # library for version 8.8
    apt_install libcminpack1
    # download salome
    wget -O salome_dist.tar.gz "https://files.salome-platform.org/Salome/Salome9.8.0/SALOME-9.8.0-native-UB20.04-SRC.tar.gz"
    if [ $? -eq 0 ]; then
        tar -xzf salome_dist.tar.gz
        if [ $? -eq 0 ]; then
            echo "alias salome='~/SALOME-9.8.0-native-UB20.04-SRC/salome'" >> ~/.bashrc
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
# setup local python
echo "export PATH=~/.local/bin:$PATH" >> ~/.bashrc
# personnal setup
echo "alias h='history'" >> ~/.bashrc
echo "shopt -s direxpand" >> ~/.bashrc
# clean
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get -y autoremove
# SUPRESS REPORT ERROR MESSAGES
sudo rm -v /var/crash/*
sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport
sudo systemctl disable apport.service
#
# Wallpaper I use
wget https://www.dropbox.com/s/1qkimjutqdt0lrb/black-waves-3840x2160-4k.jpg?dl=0 -O $HOME/blackwaves.jpg
gsettings set org.gnome.desktop.background picture-uri file:///$HOME/blackwaves.jpg
echo "Done !"
