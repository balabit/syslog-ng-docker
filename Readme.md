## What kind of syslog-ng docker images are exist

  * There are two types of docker images:
     * balabit/syslog-ng image where syslog-ng is installed in a fresh Debian 8 (Jessie) operation system from (official) deb package. This docker image is for to use syslog-ng as system logging service.
     * balabit/syslog-ng-dev development image. This image based on also a fresh Debian 8 (Jessie). This image is not contain syslog-ng, it only contains all packages to build and debug syslog-ng within the container.

  * Later we will describe how to use each of this images in a various cases.

## What is balabit/syslog-ng image and what provide it to us
  * This image provides an installed syslog-ng from deb package with its all modules (also incubator) and dependencies
  * To know what image versions are exist please check the syslog-ng image tags at the official docker repository [https://registry.hub.docker.com/u/balabit]
  * Within the container syslog-ng will start in foreground. This is useful because if there is some error with syslog-ng we can easily check the output console log through the ```docker logs [containerID]``` command
  * We can use our external syslog-ng.conf to start it with syslog-ng
  * From inside the container by default the following default ports will be exposed:
      * Syslog UDP: 514,
      * Syslog TCP: 601,
      * Syslog TLS: 6514

### How to start syslog-ng with the default configuration
  * Assume that the following ports are not used on host machine, because they can conflict: 514, 601

```
sudo docker run --rm -p 514:514 -p 601:601 --name syslog-ng balabit/syslog-ng:latest
```
  *  By default syslog-ng will not print any debug messages to the console, if you want to see more debug messages from syslog-ng you need to start container in this way:

```
sudo docker run --rm -p 514:514 -p 601:601 --name syslog-ng balabit/syslog-ng:latest -edv
```

### How to start syslog-ng container with custom syslog-ng configuration
  * Assume that we have a syslog-ng.conf file in an actual directory, in this case we can start syslog-ng container with this configuration in the following way
  * For example we use the following configuration:

```
@version: 3.6

source s_udp { udp ( ip("0.0.0.0") ); };
source s_tcp { tcp ( ip("0.0.0.0") ); };
source s_syslog { syslog ( ip("0.0.0.0") ); };

destination d_fudp { file ( "/tmp/output_udp.log" ); };
destination d_ftcp { file ( "/tmp/output_tcp.log" ); };
destination d_fsyslog { file ( "/tmp/output_syslog.log" ); };

log {
  source(s_udp);
  destination(d_fudp);
};

log {
  source(s_tcp);
  destination(d_ftcp);
};

log {
  source(s_syslog);
  destination(d_fsyslog);
};

```

  * With this configuration we can start balabit/syslog-ng:latest in the following way

```
sudo docker run --rm -p 514:514 -p 514:514/udp -p 601:601 --name syslog-ng -v "$PWD/syslog-ng.conf":/etc/syslog-ng/syslog-ng.conf balabit/syslog-ng:latest
```

### How to start syslog-ng container to use other containers volume:
Here we are describe how can syslog-ng image read logs from other container:

  * Assume that you already running an apache2 docker container which has a mounted volume for "/var/log/apache2/"
  * Now we can start our syslog-ng image to process that logs which stored in the volume, and send that for example to a remote machine
  * For example we can use the following syslog-ng configuration to read apache logs and send them to remote host
  * Assume that we store this syslog-ng.conf in a current directory

```
@version: 3.6

source s_apache {
  file("/var/log/apache2/access.log");
};

destination d_remote {
  tcp("[remote ip address]" port(4444));
};

log {
  source(s_apache);
  destination(d_remote);
};
```

```
sudo docker run --rm --volumes-from [containerID for apache2] -v "$PWD/syslog-ng.conf":/etc/syslog-ng/syslog-ng.conf balabit/syslog-ng:latest
```

## How to enter into container while it is running syslog-ng
  * Assume that your running container has a name "syslog-ng", in this case we can enter into this container

```
sudo docker exec -it syslog-ng /bin/bash
```

## What is balabit/syslog-ng-dev image and what provide it to us
  * This image provides a development environment to build and install syslog-ng from source
  * The basic development packages what this image contains are the following:
    * autoconf
    * automake
    * libtool
    * pkg-config
    * gdb
    * strace
    * vim
  * This image requires syslog-ng source from the host machine, and it can be build inside the docker container


### How to start balabit/syslog-ng-dev container to build syslog-ng source

  * Assume that we have syslog-ng source at our host machine at $HOME/syslog-ng, in this case we can start balabit/syslog-ng-dev image as follows, with this command we will start the image mounted with the source:

```
sudo docker run --rm -it -v $HOME/syslog-ng:/source balabit/syslog-ng-dev:latest /bin/bash
```
  * Within the image we can build and install syslog-ng like this way

```
cd /source/
./autogen.sh
mkdir build
cd build/
../configure --enable-debug --enable-all-modules --disable-sun-streams --with-libmongo-client=internal --with-jsonc=internal --with-librabbitmq-client=internal --with-ivykis=internal
make
make install
ldconfig
make check
```

  * After we build and installed syslog-ng we can start it with the following command
```
/usr/local/sbin/syslog-ng -Fedv
```

### How to start balabit/syslog-ng-incubator-dev container to build syslog-ng source

  * Assume that we have syslog-ng incubator source at our host machine at $HOME/syslog-ng-incubator, in this case we can start balabit/syslog-ng-incubator-dev image as follows, with this command we will start the image mounted with the source:

```
sudo docker run --rm -it -v $HOME/syslog-ng-incubator:/incubator-source balabit/syslog-ng-incubator-dev:latest /bin/bash
```
  * Within the image we can build and install syslog-ng like this way

```
cd /incubator-source/
autoreconf -i
mkdir build
cd build/
../configure
make
make install
make check
```

  * After we build and installed syslog-ng we can start it with the following command
```
/usr/sbin/syslog-ng -Fedv
```
