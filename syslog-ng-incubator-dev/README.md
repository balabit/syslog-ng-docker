# `balabit/syslog-ng-incubator-dev`
## DEPRECATED images
These images are now outdated and deprecated. You can find their updated versions in the ['main syslog-ng repository']( https://github.com/balabit/syslog-ng/tree/master/dbld/images). The new images are built automatically.

This image provides a development environment to build and install syslog-ng-incubator from source. You have to clone the source
code of [syslog-ng-incubator](https://github.com/balabit/syslog-ng-incubator.git) into a directory on your host machine then you can mount it
into the container (under `/source`).

## Building syslog-ng-incubator from source
Assume that we have cloned syslog-ng-incubator's source into the `$HOME/syslog-ng-incubator` directory. The following commands starts a container mounted with the source:


```bash
sudo docker run --rm -it -v $HOME/syslog-ng-incubator:/source balabit/syslog-ng-incubator-dev:latest /bin/bash
```

Within the image you can build and install syslog-ng-incubator:

```bash
cd /source/
autoreconf -i
mkdir build
cd build/
../configure
make
make check
make install
```

If the compilation and installation was successful you can run syslog-ng with the following command:

```bash
/usr/sbin/syslog-ng -Fedv
```
