FROM balabit/syslog-ng-dev:latest
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

ENV PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig/

RUN apt-get update -qq && apt-get install -y \
    gperf \
    libevent-dev \
    liblua5.2-dev \
    libmongo-client-dev \
    libperl-dev \
    librdkafka-dev \
    libtokyocabinet-dev \
    libzmq3-dev \
    syslog-ng-dev

RUN git clone https://github.com/talien/grok.git /root/grok && \
    cd /root/grok && \
    autoreconf -i && \
    ./configure && \
    make && \
    make install

ADD libgrok.conf /etc/ld.so.conf.d/libgrok.conf
RUN ldconfig
