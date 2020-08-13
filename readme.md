# Vis-Kt Docker container with IDC repositories

## Dependencies:

* [Git](https://git-scm.com/) 
* [Docker](https://www.docker.com/)

Clone this repository with:

> Linux: ```git clone --recursive https://github.com/ericmacedo/IDC-Production.git```

> Windows: ```git.exe clone --recursive https://github.com/ericmacedo/IDC-Production.git```

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

1) Download and run the docker container:
```
docker run -dit \
    --name vis-kt \
    -p 8080:80 \
    --mount type=bind,source="$(pwd)"/IC3,target=/var/www/html/IC3 \
    --mount type=bind,source="$(pwd)"/IC5,target=/var/www/html/IC5 \
    ericmacedo/vis-kt:v1
```

2) To add a new user, just create a new folder with the username inside the ''/IC*/users/'' folder.

---
If you want to build the container image, run the following command:
```
docker build -t vis-kt .
```