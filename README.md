# CFD-install-post-ubuntu

Script to post install Ubuntu 18.04 with
1. computational fluid dynamics (CFD) codes : 
   * OpenFoam - Foundation version
   * OpenFoam - ESI version
1. SALOME mesh (CAD + meshing)
1. Python3 librairies to plot and analyze data

Stages :
1. Install Ubuntu 20.04
2. Setup your basic ubuntu system (make sure to stay in LTS version 20.04 !)
3. Download the script :
    wget https://raw.githubusercontent.com/JulienReveillon/CFD-install-post-ubuntu/master/CFD-install-post-ubuntu1804-level1-baseCFD.sh   
4. by default : the script install OpenFoam foundation (.org) version - if you want also the ESI (.com) version edit the script and put the ESI flag to "on".
5. Execute the script : (warning : do not execute this script while ubuntu is updating)
    #> bash CFD-install-post-ubuntu1804-level1-baseCFD.sh
    
    warning : it will ask you for the sudo passwd, enter it.
    but do no sudo the whole script otherwise you will have owner/group problems
    be sure to have a fast internet connection, SALOME package is greater than 3Go
    
6. Restart ubuntu - you're all set
7. If you installed both fondation and ESI versions, when you open a terminal, type 'oforg' to charge foundation version and 'ofcom' to charge ESI version.
