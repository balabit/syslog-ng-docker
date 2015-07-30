FROM debian:latest
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

ENV PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig/

RUN apt-get update -qq && apt-get install -y \
    wget

RUN wget -qO - http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng-3.6/Debian_8.0/Release.key | apt-key add -
RUN echo 'deb http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng-3.6/Debian_8.0 ./' | tee --append /etc/apt/sources.list.d/syslog-ng-obs.list

ADD dev-dependencies.txt .
RUN cat dev-dependencies.txt | grep -v "#" | xargs apt-get install -y

ADD openjdk-libjvm.conf /etc/ld.so.conf.d/openjdk-libjvm.conf
ADD libsyslog-ng.conf /etc/ld.so.conf.d/libsyslog-ng.conf

RUN mkdir /source
VOLUME /source
