# Vis-Kt Vagrant Box with IDC repositories

## Dependencies:

* [Git](https://git-scm.com/) 
* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

Clone this repository with:

> Linux: ```git clone --recursive https://github.com/ericmacedo/IDC-Production.git```

> Windows: ```git.exe clone --recursive https://github.com/ericmacedo/IDC-Production.git```

## Box specs

* Distro: Ubuntu 18.04.4 LTS (Bionic Beaver)
* Box size: 1.7G
* RAM: 1GB
* Storage: 10GB
* Authentication:
    * User:     vagrant
    * Password: vagrant

## Versions

* Interactive Document Clustering v3
    * [Main page](localhost:8080/IC3/index.html)
    * [Upload page](localhost:8080/IC3/upload.html)
    * [Sankey diagram](localhost:8080/IC3/upload.html)
* Interactive Document Clustering v5
    * [Main page](localhost:8080/IC5/index.html)
    * [Upload page](localhost:8080/IC5/upload.html)
    * [Sankey diagram](localhost:8080/IC5/upload.html)

## Instructions 
*All commands must be executed inside this repository's root folder*

1) Power up:

> Linux:    ```vagrant up```

> Windows: ```vagrant.exe up```

2) Turn off:

> Linux:    ```vagrant halt```

> Windows: ```vagrant.exe halt```

3) SSH into the virtual machine:

> Linux:    ```vagrant ssh```

> Windows: ```vagrant.exe ssh```

4) To add a new user, just create a new folder with the username inside the ''/IC*/users/'' folder.
