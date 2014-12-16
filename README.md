docker-torrentflux
==================

Docker builder file for torrentflux (mysql is includes as part of the image/container)

### Building

Docker offers the option of building an image directly from a GIT repository (option 1). Otherwise, you can clone the repository first and go from there.

#### directly from github

1. docker build -t torrentflux https://github.com/tuliosalvaro/docker-torrentflux.git

#### clone and build

1. git clone https://github.com/tuliosalvaro/docker-torrentflux.git

2. cd docker-torrentflux

3. docker build -t torrentflux .

### Running

docker run -p 80:80 torrentflux

#### Extra (optional) options

* mount the folder where torrents will be downloaded to in the host OS: -v <host folder>:/var/cache/torrentflux

 * e.g. -v /data/torrentflux:/var/cache/torrentflux

* name the container: --name <name>

### Features

* Torrentflux is available from http://<host IP>/ (default username/password: admin/admin)
* http://<HOST>/downloads provides direct access to the downloaded files
