# syslog-ng docker images

 * This repository provides some Dockerfiles for the following purposes:
   * Create basic environments, contains only required packages for the local building
      * If you are a developer, this image is for you: just clone your own forked syslog-ng repo and you can start building, testing it.
   * Create development images, based on previous "basic environment image", contains the latest syslog-ng(+incubator) source which are built locally
      * If you want to try current syslog-ng built from our upstream this is your image. Features in incubator are also available.
   * Create service images, contains installed syslog-ng from native package (native packages are from our OBS hosted repositories)
      * If you want to get familiar with syslog-ng which is running and pre-configured then these images are for you.

 * Supported platforms
   * CentOS 7
   * Debian Jessie
   * Ubuntu Trusty

 * Supported versions
   * syslog-ng-3.6
   * syslog-ng-3.7

 * Repository also contains examples how syslog-ng works with other destination services e.g: Apache Kafka (Playground images)

 * Autobuilt images can be downloaded from [Docker Hub](https://registry.hub.docker.com/repos/balabit/)
