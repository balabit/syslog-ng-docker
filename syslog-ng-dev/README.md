# `balabit/syslog-ng-dev`
## DEPRECATED images
These images are now outdated and deprecated. You can find their updated versions in the ['main syslog-ng repository']( https://github.com/balabit/syslog-ng/tree/master/dbld/images). The new images are built automatically.

This image provides a development environment to build and install syslog-ng from source. You have to clone the source
code of [syslog-ng ](https://github.com/balabit/syslog-ng.git) into a directory on your host machine then you can mount it
into the container (under `/source`).

## Building syslog-ng from source

Assume that we have cloned syslog-ng's source into the `$HOME/syslog-ng` directory. The following commands starts a container mounted with the source:

```bash
sudo docker run --rm -it -v $HOME/syslog-ng:/source balabit/syslog-ng-dev:latest /bin/bash
```

Within the image you can build and install syslog-ng:

```bash
cd /source/
pip install -r requirements.txt
./autogen.sh
mkdir build
cd build/
../configure --enable-debug --prefix=/install/syslog-ng
make
make check
make install
```

If the compilation and installation was successful you can run syslog-ng with the following command:

```bash
/install/syslog-ng/sbin/syslog-ng -Fedv
```
