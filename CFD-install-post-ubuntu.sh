#!/bin/bash






sudo apt-get -y
sudo apt-get -y instal:
#!/usr/bin/env python
# Automatically generated script by
# vagrantbox/doc/src/vagrant/src-vagrant/deb2sh.py
# where vagrantbox is the directory arising from
# git clone git@github.com:hplgit/vagrantbox.git

# The script is based on packages listed in LinuxPkg.txt.

logfile = 'tmp_output.log'  # store all output of all operating system commands
f = open(logfile, 'w'); f.close()  # touch logfile so it can be appended

import subprocess, sys

def system(cmd):
    """Run system command cmd."""
    print cmd
    try:
        output = subprocess.check_output(cmd, shell=True,
                                         stderr=subprocess.STDOUT)
    except subprocess.CalledProcessError as e:
        print 'Command\n  %s\nfailed.' % cmd
        print 'Return code:', e.returncode
        print e.output
        sys.exit(1)
    print output
    f = open(logfile, 'a'); f.write(output); f.close()

system('sudo apt-get update --fix-missing')
# Install downloaded source code in ~/srclib
# cd

cmd = """
if [ ! -d srclib ]; then mkdir srclib; fi
# JR Editors

"""
system(cmd)
system('sudo apt-get -y install emacs')
system('sudo apt-get -y install emacs24-lucid')
system('sudo apt-get -y install python-mode')
system('sudo apt-get -y install gedit')
system('sudo apt-get -y install vim')
system('sudo apt-get -y install ispell')
system('sudo apt-get -y install texstudio')

# Compilers
system('sudo apt-get -y install gcc')
system('sudo apt-get -y install g++')
system('sudo apt-get -y install gawk')
system('sudo apt-get -y install f2c')
system('sudo apt-get -y install gfortran')
system('sudo apt-get -y install autoconf')
system('sudo apt-get -y install automake')
system('sudo apt-get -y install autotools-dev')
system('sudo apt-get -y install cmake')

# Numerical libraries
system('sudo apt-get -y install libatlas-base-dev')
system('sudo apt-get -y install libsuitesparse-dev')

# JR Software development and OF compilation necessary
system('sudo apt-get -y install git-core')
system('sudo apt-get -y install build-essential')
system('sudo apt-get -y install binutils-dev')
system('sudo apt-get -y install cmake')
system('sudo apt-get -y install flex')
system('sudo apt-get -y install bison')
system('sudo apt-get -y install meld')
system('sudo apt-get -y install zlib1g-dev')
system('sudo apt-get -y install qt4-dev-tools')
system('sudo apt-get -y install libqt4-dev')
system('sudo apt-get -y install libqtwebkit-dev')
system('sudo apt-get -y install libreadline-dev')
system('sudo apt-get -y install libncurses-dev')
system('sudo apt-get -y install libxt-dev')
system('sudo apt-get -y install libopenmpi-dev')
system('sudo apt-get -y install openmpi-bin')
system('sudo apt-get -y install libboost-system-dev')
system('sudo apt-get -y install libboost-thread-dev')
system('sudo apt-get -y install libgmp-dev')
system('sudo apt-get -y install libmpfr-dev')
system('sudo apt-get -y install libcgal-dev')
system('sudo apt-get -y install libglu1-mesa-dev')
system('sudo apt-get -y install libqt4-opengl-dev')
system('sudo apt-get -y install hdf5-helpers')
system('sudo apt-get -y install hdf5-tools')
system('sudo apt-get -y install hdfview')
system('sudo apt-get -y install libhdf5-10')
system('sudo apt-get -y install libhdf5-cpp-11')
system('sudo apt-get -y install libhdf5-dev')
system('sudo apt-get -y install wget')


# JR Version control systems
system('sudo apt-get -y install subversion')
system('sudo apt-get -y install mercurial')
system('sudo apt-get -y install cvs')
system('sudo apt-get -y install git')
system('sudo apt-get -y install gitk')

#
#  JR Python
#

# Matplotlib requires libfreetype-dev libpng-dev
# (otherwise pip install matplotlib does not work)
system('sudo apt-get -y install libfreetype6-dev')
system('sudo apt-get -y install libpng-dev')
system('sudo apt-get -y install idle')
system('sudo apt-get -y install spyder')

# Python3 
system('sudo apt-get -y install python3-pip')
system('sudo apt-get -y install python3-dev')
system('sudo apt-get -y install python3-opengl')
# upgrade pip3

cmd = """
sudo -H pip3 install --upgrade pip
#pip  install

"""
system(cmd)
system('sudo pip install setuptools')
system('sudo pip install numpy')
system('sudo pip install sympy')
system('sudo pip install numexpr')
system('sudo pip install matplotlib')
system('sudo pip install redis')
system('sudo pip install bokeh')
system('sudo pip install ipython')
system('sudo pip install panda')
system('sudo pip install scipy')
system('sudo pip install pytest')
system('sudo pip install flake8')
system('sudo pip install numpydoc')
system('sudo pip install pygame')
#
# JR plot, CAD, mesh softwares
#
system('sudo apt-get -y install blender')
system('sudo apt-get -y install freecad')
system('sudo apt-get -y install mayavi2')
system('sudo apt-get -y install meshlab')
# Gnuplot (use qt backend)
system('sudo apt-get -y install gnuplot')
system('sudo apt-get -y install gnuplot-doc')
system('sudo apt-get -y install gnuplot-qt')
system('sudo apt-get -y install python-gnuplot')
system('sudo apt-get -y install liblualib50-dev')


# Plotting and visualization programs
system('sudo apt-get -y install grace')
system('sudo apt-get -y install dx')
system('sudo apt-get -y install dx-doc')
system('sudo apt-get -y install tcl-vtk')
system('sudo apt-get -y install python-vtk')
system('sudo apt-get -y install libvtk5-dev')

# JR pseudo-Matlab
system('sudo apt-get -y install octave')
system('sudo apt-get -y install octave-splines')
system('sudo apt-get -y install octave-symbolic')
system('sudo apt-get -y install octave-specfun')
system('sudo apt-get -y install octave-optim')
system('sudo apt-get -y install octave-odepkg')
#octave-audio

# Databases
system('sudo apt-get -y install libsqlite3-dev')

# Drawing programs
system('sudo apt-get -y install inkscape')
system('sudo apt-get -y install xfig')
system('sudo apt-get -y install xfig-doc')
system('sudo apt-get -y install transfig')
system('sudo apt-get -y install fig2ps')

# Image manipulation
system('sudo apt-get -y install imagemagick')
system('sudo apt-get -y install vlc')
system('sudo apt-get -y install netpbm')
system('sudo apt-get -y install mjpegtools')
system('sudo apt-get -y install pdftk')
system('sudo apt-get -y install giftrans')
system('sudo apt-get -y install gv')
system('sudo apt-get -y install evince')
system('sudo apt-get -y install smpeg-plaympeg')
system('sudo apt-get -y install mplayer')
system('sudo apt-get -y install totem')
system('sudo apt-get -y install ffmpeg')
system('sudo apt-get -y install libav-tools')


# Support for French
system('sudo apt-get -y install language-pack-fr-base')
system('sudo apt-get -y install language-pack-fr')

# Download source code and install in srclib subdirectory

#Works only with pip2
#pip install -e git+https://github.com/hplgit/scitools.git#egg=scitools
#pip install -e git+https://github.com/hplgit/odespy.git#egg=odespy


# OPENFOAM

# Install OpenFOAM code in OpenFOAM
# cd
