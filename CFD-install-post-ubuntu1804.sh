#!/bin/bash

### by default : light install (for virtual boxes)
mode="light"
### for completes install : mode full
#mode="full"

set -x  # make sure each command is printed in the terminal

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

##### upgrade system
sudo apt-get update
sudo apt upgrade -y


##### Text Editors
if [$mode = "full" ]
then
    # atom editor
    sudo add-apt-repository ppa:webupd8team/atom -y
    sudo apt-get update
    apt_install atom
    # vim
    apt_install vim
    apt_install ispell
    # latex editor
    apt_install texstudio
    # code edition
    apt_install meld
fi


##### Version control
apt_install git
if [$mode = "full" ]
then
    apt_install subversion
    apt_install mercurial
    apt_install cvs
    apt_install git
    apt_install gitk
fi

#### Compilers and compilation and hdf5
apt_install gcc
apt_install g++
apt_install gawk
apt_install f2c
apt_install gfortran
apt_install autoconf
apt_install automake
apt_install autotools-dev
apt_install hdf5-helpers
apt_install hdf5-tools
apt_install hdfview
apt_install libhdf5-100
apt_install libhdf5-cpp-100
apt_install libhdf5-dev

# for other install
apt_install aptitude

##### OF libraries

# Numerical libraries
#apt_install libatlas-base-dev
#apt_install libsuitesparse-dev

# OF compilation necessary
# most of them are already installed
# https://openfoamwiki.net/index.php/Installation/Linux/OpenFOAM-7/Ubuntu/18.04
apt_install build-essential 
apt_install flex
apt_install bison 
apt_install cmake 
apt_install zlib1g-dev 
apt_install libboost-system-dev
apt_install libboost-thread-dev 
apt_install libopenmpi-dev 
apt_install openmpi-bin
apt_install gnuplot
apt_install libreadline-dev 
apt_install libncurses-dev 
apt_install libxt-dev
apt_install qt5-default 
apt_install libqt5x11extras5-dev 
apt_install libqt5help5 
apt_install qtdeclarative5-dev 
apt_install qttools5-dev
apt_install qtbase5-dev
apt_install libqtwebkit-dev
apt_install freeglut3-dev
apt_install libqt5opengl5-dev
apt_install texinfo
apt_install libscotch-dev
apt_install libcgal-dev 
apt_install git-core 
apt_install build-essential 
apt_install libfl-dev 
apt_install libgmp-dev
apt_install libmpfr-dev
apt_install curl
apt_install python 
apt_install python-dev
apt_install aptitude
apr_insatll software-properties-common


##### Python

# Python3
apt_install python3-pip
apt_install python3-opengl
# upgrade pip3
sudo -H pip3 install --upgrade pip

#pip  install
pip_install setuptools
pip_install numpy
pip_install sympy
pip_install numexpr
pip_install matplotlib
pip_install redis
pip_install bokeh
pip_install ipython
pip_install panda
pip_install scipy
pip_install pytest
pip_install flake8
pip_install numpydoc
pip_install pygame
pip_install xkcd
pip_install seaborn

# pycharm
sudo snap install pycharm-community --classic

### cantera
sudo aptitude install python-software-properties
sudo apt-add-repository ppa:speth/cantera
sudo aptitude update
sudo aptitude install cantera-python cantera-python3 cantera-dev


#
# JR plot, CAD, mesh softwares
#
# Gnuplot (use qt backend)
apt_install gnuplot
apt_install gnuplot-doc
apt_install gnuplot-qt
apt_install python-gnuplot
apt_install liblualib50-dev

apt_install meshlab
apt_install freecad
if [$mode = "full" ]
then
    apt_install blender
    apt_install freecad
    apt_install mayavi2
    apt_install meshlab

fi


# Plotting and visualization programs
#apt_install grace
#apt_install dx
#apt_install dx-doc
#apt_install tcl-vtk
#apt_install python-vtk
#apt_install libvtk5-dev

# JR pseudo-Matlab
#apt_install octave
#apt_install octave-splines
#apt_install octave-symbolic
#apt_install octave-specfun
#apt_install octave-optim
#apt_install octave-odepkg
#octave-audio

# Databases
#apt_install libsqlite3-dev
apt_install vlc
if [$mode = "full" ]
then
    # Drawing programs
    apt_install inkscape

    # Image manipulation
    apt_install imagemagick
    apt_install netpbm
    apt_install mjpegtools
    apt_install giftrans
    apt_install mplayer
    apt_install ffmpeg

# Support for French
apt_install language-pack-fr-base
apt_install language-pack-fr
fi

# OPENFOAM

# OpenFoam fondation package
echo "OpenFoam fondation package !"
sudo sh -c "wget -O - https://dl.openfoam.org/gpg.key | apt-key add -"
sudo add-apt-repository http://dl.openfoam.org/ubuntu
sudo apt-get update
sudo apt-get -y install openfoam8
echo "alias of80='. /opt/openfoam8/etc/bashrc'" >> ~/.bashrc
. /opt/openfoam8/etc/bashrc
mkdir -p "$FOAM_RUN"

#olaflow
cd ~
git clone git://github.com/phicau/olaFlow.git
cd olaFlow
./allMake
cd ~



# THE END
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get -y autoremove
echo "Done !"
