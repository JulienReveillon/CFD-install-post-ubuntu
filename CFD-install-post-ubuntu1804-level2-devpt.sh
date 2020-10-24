#!/bin/bash
#------------------------------
#-  Julien Reveillon          -
#-  Julien.Reveillon@coria.fr -
#-  24/10/2020                -
#------------------------------
# Script to install basic CFD tools
# Ubuntu 18.04
# Before, you should execute :
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
# edition
apt_install vim
apt_install ispell
apt_install texstudio
apt_install language-pack-fr-base
apt_install language-pack-fr
# prog development
apt_install curl
apt_install meld
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
# image
apt_install vlc
apt_install inkscape
apt_install imagemagick
apt_install netpbm
apt_install mjpegtools
apt_install giftrans
apt_install mplayer
apt_install ffmpeg
# python packages
pip_install numexpr
pip_install redis
pip_install bokeh
pip_install ipython
pip_install panda
pip_install pytest
pip_install flake8
pip_install numpydoc
pip_install xkcd

# THE END
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get -y autoremove
echo "Done !"
