# generated image name from this dockerfile: ubuntu_base_for_syslog_ng
FROM ubuntu:latest
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

ENV INSTALL_DIR=/opt/syslog-ng
ENV PKG_CONFIG_PATH=$PKG_CONFIG_PATH:${INSTALL_DIR}/lib/pkgconfig:/usr/local/lib/pkgconfig/
ENV INSTALLED_JAVA_VERSION=java-7-openjdk-amd64
ENV JAVA_HOME=/usr/lib/jvm/${INSTALLED_JAVA_VERSION}/jre/
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jvm/${INSTALLED_JAVA_VERSION}/jre/lib/amd64/server/:/usr/local/lib/

RUN apt-get update && apt-get install -y git

ADD ubuntu_apt_requirements.txt .
RUN cat ubuntu_apt_requirements.txt | grep -v "#" | xargs apt-get install -y

ADD ubuntu_pip_requirements.txt .
RUN cat ubuntu_pip_requirements.txt | grep -v "#" | xargs pip install

ADD install_requirements_from_source.sh .
RUN ./install_requirements_from_source.sh

ADD checkout_and_build_syslog_ng.sh /checkout_and_build_syslog_ng.sh
