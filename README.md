# docker-pypiserver
Dockerfile for running [pypiserver](https://github.com/pypiserver/pypiserver) in a Docker container.

* Base image: [`pypy:2-slim`](https://hub.docker.com/_/pypy/)
* Exposed ports: `8080`
* Volumes: `/packages/`, `/.htpasswd`
* Command: `pypi-server`

`passlib` and `watchdog` are installed for authentication and caching support, respectively.

### Usage:
```shell
docker run --rm -it -p 8080:8080 -v $HOME/packages:/packages -v $HOME/.htpasswd:/.htpasswd praekeltfoundation/pypiserver
```

This will expose the service at port 8080 on the host with the packages directory and `.htpasswd` file mounted as volumes.

**NOTE:** Both volumes are optional -- but without the packages directory package files will only be available within the container and without the `.htpasswd` file you won't be able to upload any packages unless you set pypiserver's `--authenticate` flag to allow unauthenticated uploads.

To customize the other pypiserver settings, simply override the default `CMD`:
```shell
docker run ... praekeltfoundation/pypiserver pypi-server -v --hash-algo SHA256 ...
```
