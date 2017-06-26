FROM debian:jessie
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

RUN apt-get update -qq && apt-get install -y \
    wget \
    gnupg2

RUN wget -qO - https://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Debian_8.0/Release.key | apt-key add -
RUN echo 'deb http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Debian_8.0 ./' | tee --append /etc/apt/sources.list.d/syslog-ng-obs.list

RUN apt-get update -qq && apt-get install -y \
    syslog-ng

ADD openjdk-libjvm.conf /etc/ld.so.conf.d/openjdk-libjvm.conf
RUN ldconfig

EXPOSE 514/udp
EXPOSE 601/tcp
EXPOSE 6514/tcp

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]
