FROM centos:latest
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

ADD https://copr.fedoraproject.org/coprs/czanik/syslog-ng36/repo/epel-7/czanik-syslog-ng36-epel-7.repo /etc/yum.repos.d/
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
  syslog-ng-incubator \
  syslog-ng
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.45-30.b13.el7_1.x86_64/jre/
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.45-30.b13.el7_1.x86_64/jre/lib/amd64/server/:/usr/lib64/

CMD ["/sbin/syslog-ng", "-Fedv"]
