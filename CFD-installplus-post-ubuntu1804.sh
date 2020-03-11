##!/bin/bash

# complete install


# Install OpenFOAM - ESI version
if [ ! -d $HOME/OpenFOAM ]; then mkdir $HOME/OpenFOAM; fi
cd $HOME/OpenFOAM
wget "https://sourceforge.net/projects/openfoam/files/v1912/OpenFOAM-v1912.tgz" -O OpenFOAM-v1912.tgz
wget "https://sourceforge.net/projects/openfoam/files/v1912/ThirdParty-v1912.tgz" -O ThirdParty-v1912.tgz
tar -xzf OpenFOAM-v1912.tgz
tar -xzf ThirdParty-v1912.tgz
source OpenFOAM-v1912/etc/bashrc
cd $WM_THIRD_PARTY_DIR
# warning see https://develop.openfoam.com/Development/ThirdParty-common/issues/48
sudo dpkg-reconfigure dash
# ebd warning
#./makeParaView



# ln -s /usr/bin/mpicc.openmpi OpenFOAM-4.1/bin/mpicc
# ln -s /usr/bin/mpirun.openmpi OpenFOAM-4.1/bin/mpirun
# source $HOME/OpenFOAM/OpenFOAM-4.1/etc/bashrc WM_LABEL_SIZE=64 FOAMY_HEX_MESH=yes
# echo "alias of41='source \$HOME/OpenFOAM/OpenFOAM-4.1/etc/bashrc $FOAM_SETTINGS'" >> $HOME/.bashrc
# cd $WM_THIRD_PARTY_DIR
# export QT_SELECT=qt4
# ./makeParaView -python -mpi -python-lib /usr/lib/x86_64-linux-gnu/libpython2.7.so.1.0 > log.makePV 2>&1
# wmRefresh
# cd $WM_PROJECT_DIR
# export QT_SELECT=qt4
# ./Allwmake > log.make 2>&1
# cd ..
# rm OpenFOAM-4.1.tgz
# rm ThirdParty-4.1.tgz
#
# # Clean up
# sudo mv -f src/* srclib
# sudo rm -rf src build
# sudo find srclib -name build -exec rm -rf {} \;
# cd
# sudo rm -rf .matplotlib
# mkdir .matplotlib
# sudo apt-get clean
# sudo apt-get autoclean
# sudo apt-get -y autoremove
