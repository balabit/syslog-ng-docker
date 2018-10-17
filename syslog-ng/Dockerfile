FROM debian:jessie
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

RUN apt-get update -qq && apt-get install -y \
    wget \
    gnupg2

RUN wget -qO - https://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Debian_8.0/Release.key | apt-key add -
RUN echo 'deb http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Debian_8.0 ./' | tee --append /etc/apt/sources.list.d/syslog-ng-obs.list

RUN apt-get update -qq && apt-get install -y \
    syslog-ng

# With https://github.com/balabit/syslog-ng/commit/b095ac69314f3cb75aff3e873df416de22ede831
# container detection was dropped from syslog-ng (detection was not reliable)
RUN sed -i.bak 's/system()/system(exclude-kmsg(yes))/g' /etc/syslog-ng/syslog-ng.conf

ADD openjdk-libjvm.conf /etc/ld.so.conf.d/openjdk-libjvm.conf
RUN ldconfig

EXPOSE 514/udp
EXPOSE 601/tcp
EXPOSE 6514/tcp

ENTRYPOINT ["/usr/sbin/syslog-ng", "-F"]
