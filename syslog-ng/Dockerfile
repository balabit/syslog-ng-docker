FROM debian:stretch
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

RUN apt-get update -qq && \
    apt-get install -y \
    wget \
    gnupg2 && \
    wget -qO - https://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Debian_9.0/Release.key | apt-key add - &&\
    echo 'deb http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Debian_9.0 ./' | tee --append /etc/apt/sources.list.d/syslog-ng-obs.list && \
    apt-get clean

RUN apt-get update -qq && apt-get install -y \
    syslog-ng && \
    apt-get clean && \
    find /usr/lib/ -name 'libjvm.so*' | xargs dirname | tee --append /etc/ld.so.conf.d/openjdk-libjvm.conf && \
    ldconfig && \
    mkdir -p /etc/syslog-ng/conf.d

ADD syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

RUN syslog-ng -s --no-caps

EXPOSE 514/udp
EXPOSE 601/tcp
EXPOSE 6514/tcp
#In Docker context no need to manage capabilities
ENTRYPOINT ["/usr/sbin/syslog-ng", "-F","--no-caps"]
