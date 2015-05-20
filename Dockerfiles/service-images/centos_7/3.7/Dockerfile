FROM centos:latest
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

ADD https://copr.fedoraproject.org/coprs/czanik/syslog-ng37/repo/epel-7/czanik-syslog-ng37-epel-7.repo /etc/yum.repos.d/
RUN yum update -y && yum install -y epel-release

RUN yum install -y \
  java-1.8.0-openjdk \
  syslog-ng-geoip \
  syslog-ng-java \
  syslog-ng-libdbi \
  syslog-ng-mongodb \
  syslog-ng-python \
  syslog-ng-redis \
  syslog-ng-riemann \
  syslog-ng-smtp \
  syslog-ng

CMD ["/sbin/syslog-ng", "-Fedv"]
