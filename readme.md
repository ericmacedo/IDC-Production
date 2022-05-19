# Vis-Kt Docker container with IDC repositories

## Dependencies:

* [Git](https://git-scm.com/) 
* [Docker](https://www.docker.com/)
    * Docker compose plugin

Clone this repository with:

> Linux: ```git clone --recursive https://github.com/ericmacedo/IDC-Production.git```

> Windows: ```git.exe clone --recursive https://github.com/ericmacedo/IDC-Production.git```

## Versions

* Interactive Document Clustering v3
* Interactive Document Clustering v5

## Instructions 
> Observations:
> - All commands must be executed inside this repository's root folder*
> - The command `docker-compose` might change from system to system. It is also common to have the command as `docker compose`


1) To start the server:
    ```shell
    docker-compose up
    ```
    - You can add a `-d` at the end of the command to run it as a daemon in background

2) To stop the server:
    ```shell
    docker-compose stop
    ```

3) To add a new user:
    ```shell
    docker-compose run --rm main --system=SYSTEM --create=USER
    ```
    - SYSTEM is the name of the system that you want to add a new user to (_Options: [IC3, IC5]_)
    - USER: the name of the user

4) To remove a user:
    3) To add a new user:
    ```shell
    docker-compose run --rm main --system=SYSTEM --remove=USER
    ```
    - USER: the name of the user to be removed
