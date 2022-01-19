# Deprecation warning

This repository has been deprecated and is no longer maintained.
It has been superseded by [syslog-ng](https://github.com/syslog-ng/syslog-ng/), where the syslog-ng Docker image is
published automatically after each release.

Moved folders:
- syslog-ng: [`docker`](https://github.com/syslog-ng/syslog-ng/tree/master/docker)
- syslog-ng-helm-chart: [`contrib/syslog-ng-helm-chart`](https://github.com/syslog-ng/syslog-ng/tree/master/contrib/syslog-ng-helm-chart)

# syslog-ng Docker images
This repository contains the source of the following Docker images:

* `balabit/syslog-ng`: syslog-ng is installed. It is intended to be used as a system logging service.

## DEPRECATED images
This repository also contained the following images. However, these images are now outdated and deprecated. You can find their updated versions in the [main syslog-ng repository]( https://github.com/balabit/syslog-ng/tree/master/dbld/images).
* `balabit/syslog-ng-dev`: ***DEPRECATED*** development image for [syslog-ng](https://github.com/balabit/syslog-ng). It contains all packages to build and debug syslog-ng within the container.
* `balabit/syslog-ng-incubator-dev`: ***DEPRECATED*** development image for [syslog-ng-incubator](https://github.com/balabit/syslog-ng-incubator). It contains all packages to build and debug syslog-ng-incubator within the container.

## More information
For detailed information on how to run your central log server in Docker and other Docker-related syslog-ng use cases, see the blog post [Your central log server in Docker](https://syslog-ng.com/blog/central-log-server-docker/).
