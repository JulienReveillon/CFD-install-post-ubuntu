# CFD-install-post-ubuntu

Note : see the following link for more details and tutorials or to download a complete CFD Virtual machine : 

https://www.julienreveillon.com/cfd-virtual-machines


## Description 
Script to post install Ubuntu LTS with
1. computational fluid dynamics (CFD) codes : 
   1. OpenFoam - Foundation version (.org)
   1. OpenFoam - ESI/OpenCFD version (.com)
1. CAD Tools
   1. SALOME mesh (CAD + meshing)
   1. meshlab
   1. freecad
1. Python3 librairies to plot and analyze data 
   1. matplotlib
   1. scipy
   1. numpy
   1. sympy
   1. PyFoam
   1. seaborn
   1. pygame
1. Usefull tools
   1. git
   1. aptitude
   1. curl
   1. tree
   1. meld
   

## How to use :
1. Install Ubuntu 20.04
2. Setup your basic ubuntu system (make sure to stay in LTS version 20.04 !)
3. Download the script :
    wget https://raw.githubusercontent.com/JulienReveillon/CFD-install-post-ubuntu/master/CFD-install-baseCFD.sh
4. switchto on or off the first 4 flags.
5. Execute the script : (warning #1 : do not execute this script while ubuntu is updating)
    #> bash CFD-install-baseCFD.sh
    
    warning #2 : it will ask you for the sudo passwd, enter it.
    but do no sudo the whole script otherwise you will have owner/group problems
    be sure to have a fast internet connection, SALOME package is greater than 3Go
    
6. Restart ubuntu - you're all set
7. If you installed both fondation and ESI versions, when you open a terminal, type 'oforg' to charge foundation version and 'ofcom' to charge ESI version.

