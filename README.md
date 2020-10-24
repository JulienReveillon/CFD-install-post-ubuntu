# CFD-install-post-ubuntu

Script to post install Ubuntu 18.04 with
1. computational fluid dynamics (CFD) codes : OpenFoam - Foundation version
1. thermodynamic packages (Cantera)
1. SALOME mesh (CAD + meshing)
1. Python3 librairies to plot and analyze data

Stages :
1. Install Ubuntu 18.04
1. Be sure that to update your basic ubuntu system
    warning : do not exectute this script while ubuntu is updating
1. Download the script :

    cd
    wget https://raw.githubusercontent.com/JulienReveillon/CFD-install-post-ubuntu/master/CFD-install-post-ubuntu1804-level1-baseCFD.sh
    
1. Execute the script :

    bash CFD-install-post-ubuntu1804-level1-baseCFD.sh > log.baseCFD
    
warning : it will ask you for the sudo passwd several time, enter it.
but do no sudo the whole script otherwise you will have owner/group problems
be sure to have a fast internat connection, SALOME package > 3Go

1. Restart ubuntu
