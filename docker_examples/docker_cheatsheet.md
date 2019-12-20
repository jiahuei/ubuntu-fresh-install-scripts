# Cheatsheet

## Build Image using Dockerfile
**Steps:**
1. Create a directory
2. Place required files
3. Place `Dockerfile` at root, the `Dockerfile` can be any name
4. Run `docker build -t user/image_name -f Dockerfile_name .`

**Dockerfile commands:**
1. RUN:
    * The `RUN` instruction will execute any commands in a new layer on top of the current image and commit the results. 
    * The resulting committed image will be used for the next step in the Dockerfile.

2. WORKDIR:
    * Same effect as `cd`, sets the working directory for any 
    `RUN`, `CMD`, `ENTRYPOINT`, `COPY` and `ADD` instructions that follow it in the `Dockerfile`

3. CMD:
    * There can only be one `CMD` instruction in a `Dockerfile`. 
    If you list more than one `CMD` then only the last `CMD` will take effect.
    * `CMD` tells the container which command it should run when it is started

## Restart Docker
```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```

## Docker run flags:
1. `-v, --volume=[host-src:]container-dest[:<options>]`
    * If you supply the /foo value, Docker creates a bind mount. If you supply the foo specification, Docker creates a named volume.

2. `-e`
    * Environment variables
    * `-e DISPLAY=unix$DISPLAY`

3. `-u="", --user=""`
    * Sets the username or UID used and optionally the groupname or GID for the specified command.
    * `-u $(id -u):$(id -g)`


## Purging Unused or Dangling Images, Containers, Volumes, and Networks
[(link)](https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes)

**Clean up any resources — images, containers, volumes, and networks — that are dangling**

`docker system prune`

**Additionally remove any stopped containers and all unused images**

`docker system prune -a`


## Images

**List dangling images**

`docker images -f dangling=true`

**Cleanup dangling images**
[(link)](https://stackoverflow.com/questions/45142528/what-is-a-dangling-image-and-what-is-an-unused-image/45143234#45143234)

`docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi`

**Remove image**
Use `docker image rm` or `docker rmi`:
```bash
docker image rm jiahuei/tensorflow:1.9.0-gpu
docker image rm a3c28a34f4f6
```
```bash
docker rmi jiahuei/tensorflow:1.9.0-gpu
docker rmi a3c28a34f4f6
```

**Untag image**
```bash
docker image rm --no-prune jiahuei/tensorflow:1.9.0-gpu
```


## Containers
**List containers**
* running only:

    `docker container ls`

* all:

    `docker container ls -a`

**List of all non-running (stopped) containers**

`docker container ls -a --filter status=exited --filter status=created`

**Remove containers by ID**

`docker container rm cc3f2ff51cab cd20b396a061`

**Remove all stopped containers**

`docker container prune`




