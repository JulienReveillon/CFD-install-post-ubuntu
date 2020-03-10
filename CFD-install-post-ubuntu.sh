#!/bin/bash
# Automatically generated script by
# vagrantbox/doc/src/vagrant/src-vagrant/deb2sh.py
# where vagrantbox is the directory arising from
# git clone git@github.com:hplgit/vagrantbox.git

# The script is based on packages listed in LinuxPkg.txt.

set -x  # make sure each command is printed in the terminal

function apt_install {
  sudo apt-get -y install $1
  if [ $? -ne 0 ]; then
    echo "could not install $1 - abort"
    exit 1
  fi
}

function pip_install {
  sudo -H pip install --upgrade "$@"
  if [ $? -ne 0 ]; then
    echo "could not install $p - abort"
    exit 1
  fi
}

sudo apt-get update --fix-missing

# Install downloaded source code in ~/srclib
# cd
if [ ! -d srclib ]; then mkdir srclib; fi

# JR Editors
apt_install emacs
apt_install emacs24-lucid
apt_install python-mode
apt_install gedit
apt_install vim
apt_install ispell
apt_install texstudio

# Compilers
apt_install gcc
apt_install g++
apt_install gawk
apt_install f2c
apt_install gfortran
apt_install autoconf
apt_install automake
apt_install autotools-dev
apt_install cmake

# Numerical libraries
apt_install libatlas-base-dev
apt_install libsuitesparse-dev

# JR Software development and OF compilation necessary
apt_install git-core
apt_install build-essential
apt_install binutils-dev
apt_install cmake
apt_install flex
apt_install bison
apt_install meld
apt_install zlib1g-dev
apt_install qt4-dev-tools
apt_install libqt4-dev
apt_install libqtwebkit-dev
apt_install libreadline-dev
apt_install libncurses-dev
apt_install libxt-dev
apt_install libopenmpi-dev
apt_install openmpi-bin
apt_install libboost-system-dev
apt_install libboost-thread-dev
apt_install libgmp-dev
apt_install libmpfr-dev
apt_install libcgal-dev
apt_install libglu1-mesa-dev
apt_install libqt4-opengl-dev
apt_install hdf5-helpers
apt_install hdf5-tools
apt_install hdfview
apt_install libhdf5-10
apt_install libhdf5-cpp-11
apt_install libhdf5-dev
apt_install wget


# JR Version control systems
apt_install subversion
apt_install mercurial
apt_install cvs
apt_install git
apt_install gitk

#
#  JR Python
#

# Matplotlib requires libfreetype-dev libpng-dev
# (otherwise pip install matplotlib does not work)
apt_install libfreetype6-dev
apt_install libpng-dev
apt_install idle
apt_install spyder

# Python3 
apt_install python3-pip
apt_install python3-dev
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
#
# JR plot, CAD, mesh softwares
#
apt_install blender
apt_install freecad
apt_install mayavi2
apt_install meshlab
# Gnuplot (use qt backend)
apt_install gnuplot
apt_install gnuplot-doc
apt_install gnuplot-qt
apt_install python-gnuplot
apt_install liblualib50-dev


# Plotting and visualization programs
apt_install grace
apt_install dx
apt_install dx-doc
apt_install tcl-vtk
apt_install python-vtk
apt_install libvtk5-dev

# JR pseudo-Matlab
apt_install octave
apt_install octave-splines
apt_install octave-symbolic
apt_install octave-specfun
apt_install octave-optim
apt_install octave-odepkg
#octave-audio

# Databases
apt_install libsqlite3-dev

# Drawing programs
apt_install inkscape
apt_install xfig
apt_install xfig-doc
apt_install transfig
apt_install fig2ps

# Image manipulation
apt_install imagemagick
apt_install vlc
apt_install netpbm
apt_install mjpegtools
apt_install pdftk
apt_install giftrans
apt_install gv
apt_install evince
apt_install smpeg-plaympeg
apt_install mplayer
apt_install totem
apt_install ffmpeg
apt_install libav-tools


# Support for French
apt_install language-pack-fr-base
apt_install language-pack-fr

# Download source code and install in srclib subdirectory

#Works only with pip2
#pip install -e git+https://github.com/hplgit/scitools.git#egg=scitools
#pip install -e git+https://github.com/hplgit/odespy.git#egg=odespy


# OPENFOAM

# Install OpenFOAM code in OpenFOAM
# cd
if [ ! -d OpenFOAM ]; then mkdir OpenFOAM; fi

cd OpenFOAM
wget "http://download.openfoam.org/source/4-1" -O OpenFOAM-4.1.tgz
wget "http://download.openfoam.org/third-party/4-1" -O ThirdParty-4.1.tgz
tar -xzf OpenFOAM-4.1.tgz
tar -xzf ThirdParty-4.1.tgz
mv OpenFOAM-4.x-version-4.1 OpenFOAM-4.1
mv ThirdParty-4.x-version-4.1 ThirdParty-4.1
ln -s /usr/bin/mpicc.openmpi OpenFOAM-4.1/bin/mpicc
ln -s /usr/bin/mpirun.openmpi OpenFOAM-4.1/bin/mpirun
source $HOME/OpenFOAM/OpenFOAM-4.1/etc/bashrc WM_LABEL_SIZE=64 FOAMY_HEX_MESH=yes
echo "alias of41='source \$HOME/OpenFOAM/OpenFOAM-4.1/etc/bashrc $FOAM_SETTINGS'" >> $HOME/.bashrc
cd $WM_THIRD_PARTY_DIR
export QT_SELECT=qt4
./makeParaView -python -mpi -python-lib /usr/lib/x86_64-linux-gnu/libpython2.7.so.1.0 > log.makePV 2>&1
wmRefresh
cd $WM_PROJECT_DIR
export QT_SELECT=qt4
./Allwmake > log.make 2>&1
cd ..
rm OpenFOAM-4.1.tgz
rm ThirdParty-4.1.tgz

# Clean up
sudo mv -f src/* srclib
sudo rm -rf src build
sudo find srclib -name build -exec rm -rf {} \;
cd
sudo rm -rf .matplotlib
mkdir .matplotlib
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get -y autoremove








echo "Everything is successfully installed!"

