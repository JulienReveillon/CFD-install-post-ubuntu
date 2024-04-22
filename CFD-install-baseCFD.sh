#!/bin/bash
#----------------------------------
# Script to install basic CFD tools
#----------------------------------
#-  Julien Reveillon ----------
#-  Julien.Reveillon@coria.fr -
#-  www.julienreveillon.com ---
#-  01/04/2022 ----------------
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
  pip3 install --upgrade "$@"
  if [ $? -ne 0 ]; then
    echo "could not install $p - abort"
    exit 1
  fi
}
#
echo "WARNING : works with the complete installation of Ubuntu LTS 20.04 (not the minimal one)"
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
apt_install python3-pyside2.qtnetwork
apt_install python3-pyside2.qtwebengine
apt_install python3-pyside2.qtwebchannel
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
pip_install gmsh
pip_install notebook
pip_install jupyterlab
pip_install pygame
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
sudo apt-get install libqwt-qt5-6 libqt5xml5 libqt5printsupport5 libqt5test5 libqt5x11extras5 libqt5help5 libfreeimage3 libtbb2 python3-sip python3-pyqt5 python-is-python3 python3-babel python3-pytest-cython python3-jinja2 python3-pygments python3-sphinx python3-alabaster cmake python3-cycler python3-docutils graphviz python3-imagesize python3-kiwisolver liblapack3 clang python3-matplotlib libmetis5 python3-numpy python3-packaging python3-pyparsing python3-tz python3-scipy python3-stemmer python3-sphinx-rtd-theme python3-sphinxcontrib.websupport sphinx-intl libtcl libtk libopengl0 libboost-all-dev pyqt5-dev pyqt5-dev-tools libcppunit-dev doxygen libeigen3-dev libfreeimage-dev libfreetype6-dev libgraphviz-dev liblapack-dev libxml2-dev llvm-dev mesa-common-dev libglu1-mesa-dev libmetis-dev qttools5-dev libqt5svg5-dev libqt5x11extras5-dev qtxmlpatterns5-dev-tools libqwt-qt5-dev libscotch-dev python3-sip-dev swig libtbb-dev tcl-dev tk-dev libcminpack-dev
echo "alias salome=/home/cfd/SALOME-9.12.0-native-UB22.04-SRC/salome" >> ~/.bashrc
## 



echo "--------------------------------------------"
echo "----     Install : OpenFoam - ESI"
echo "--------------------------------------------"
apt_install paraview
curl -s https://dl.openfoam.com/add-debian-repo.sh -o add-debian-repo.sh
sudo bash add-debian-repo.sh
sudo rm -f add-debian-repo.sh
sudo apt-get update
apt_install openfoam2312-default

echo ". /usr/lib/openfoam/openfoam2312/etc/bashrc" >> ~/.bashrc
echo ". \$WM_PROJECT_DIR/bin/tools/CleanFunctions" >> ~/.bashrc
echo "export PS1=\"\u@OF2312 \w> \"" >> ~/.bashrc
. /usr/lib/openfoam/openfoam2312/etc/bashrc
mkdir -p "$FOAM_RUN"

### OpenFoam - End ESI package


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
echo "WARNING : you have to download SALOME yourself"
echo "Done !"
