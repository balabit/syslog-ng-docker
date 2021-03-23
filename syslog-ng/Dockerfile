FROM debian:stretch
LABEL maintainer="Andras Mitzki <andras.mitzki@balabit.com>"

ARG SYSLOG_NG_VERSION
RUN [ -n "${SYSLOG_NG_VERSION}" ] # Please provide the version of syslog-ng you wish to install. i.e.: --build-arg SYSLOG_NG_VERSION=3.31.2-1, or use the keyword "master" to install the latest version.

RUN apt-get update -qq && apt-get install -y \
    wget \
    gnupg2

RUN wget -qO - https://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Debian_9.0/Release.key | apt-key add -
RUN echo 'deb http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Debian_9.0 ./' | tee --append /etc/apt/sources.list.d/syslog-ng-obs.list
RUN apt-get update -qq

COPY install_syslog_ng_version.sh /tmp/
RUN /tmp/install_syslog_ng_version.sh ${SYSLOG_NG_VERSION}

ADD syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

RUN find /usr/lib/ -name 'libjvm.so*' | xargs dirname | tee --append /etc/ld.so.conf.d/openjdk-libjvm.conf
RUN ldconfig

EXPOSE 514/udp
EXPOSE 601/tcp
EXPOSE 6514/tcp

HEALTHCHECK --interval=2m --timeout=3s --start-period=30s CMD /usr/sbin/syslog-ng-ctl stats || exit 1




ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]
