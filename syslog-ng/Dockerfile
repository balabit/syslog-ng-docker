FROM debian:latest
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

RUN apt-get update -qq && apt-get install -y \
    software-properties-common \
    wget \
    openjdk-7-jdk

ADD openjdk-libjvm.conf /etc/ld.so.conf.d/openjdk-libjvm.conf

RUN wget -qO - http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng-3.6/Debian_8.0/Release.key | apt-key add -
RUN echo 'deb http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng-3.6/Debian_8.0 ./' | tee --append /etc/apt/sources.list.d/syslog-ng-obs.list

RUN apt-get update -qq && apt-get install -y \
    syslog-ng \
    syslog-ng-mod*

EXPOSE 514
EXPOSE 601
EXPOSE 6514

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]
