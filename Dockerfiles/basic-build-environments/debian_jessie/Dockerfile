# generated image name from this dockerfile: debian_base_for_syslog_ng
FROM debian:latest
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

ENV INSTALL_DIR=/opt/syslog-ng
ENV PKG_CONFIG_PATH=$PKG_CONFIG_PATH:${INSTALL_DIR}/lib/pkgconfig:/usr/local/lib/pkgconfig/
ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre/
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server/:/usr/local/lib/
ENV BRANCH_URL=https://github.com/balabit/syslog-ng.git

RUN apt-get update && apt-get install -y git

ADD debian_apt_requirements.txt .
RUN cat debian_apt_requirements.txt | grep -v "#" | xargs apt-get install -y

ADD debian_pip_requirements.txt .
RUN cat debian_pip_requirements.txt | grep -v "#" | xargs pip install

ADD debian_github_requirements.sh .
RUN ./debian_github_requirements.sh

ADD checkout_and_build_syslog_ng.sh /checkout_and_build_syslog_ng.sh
#ADD checkout_and_build_syslog_ng_incubator.sh /checkout_and_build_syslog_ng_incubator.sh
