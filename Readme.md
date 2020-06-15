## Setting up a testing environment

After cloning the repo, perform the following tests to successfully setup a testing environment for __FUSE-POSIX__

```BASH
$ cd ./fuse-posix/docker
$ docker build . -t ruciofs:test
$ docker-compose --file docker-compose.yml up -d
```

This shall build a docker image which you can check by performing 

```BASH
$ docker images | grep ruciofs | grep test
```

And you can confirm if the container is running by using

```BASH
$ docker ps | grep dev_ruciofs_1
```

Now finally to begin testing we need a terminal window for our docker container,
which you can get by executing

```BASH
$ docker exec -it dev_ruciofs_1 /bin/bash
```