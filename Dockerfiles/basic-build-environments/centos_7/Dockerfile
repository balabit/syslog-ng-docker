# generated image name from this dockerfile: centos_base_for_syslog_ng
FROM centos:latest
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

ADD https://copr.fedoraproject.org/coprs/czanik/syslog-ng37/repo/epel-7/czanik-syslog-ng37-epel-7.repo /etc/yum.repos.d/
ADD https://copr.fedoraproject.org/coprs/czanik/syslog-ng36/repo/epel-7/czanik-syslog-ng36-epel-7.repo /etc/yum.repos.d/
RUN yum update -y && yum install -y epel-release git

ADD centos_rpm_requirements.txt .
RUN cat centos_rpm_requirements.txt | grep -v "#" | xargs yum install -y

ENV INSTALL_DIR=/opt/syslog-ng
ENV PKG_CONFIG_PATH=$PKG_CONFIG_PATH:${INSTALL_DIR}/lib/pkgconfig:/usr/local/lib/pkgconfig/
ENV JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.79-2.5.5.1.el7_1.x86_64/jre/
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.79-2.5.5.1.el7_1.x86_64/jre/lib/amd64/server/:/usr/lib64/

ADD checkout_and_build_syslog_ng.sh /checkout_and_build_syslog_ng.sh
ADD checkout_and_build_syslog_ng_incubator.sh /checkout_and_build_syslog_ng_incubator.sh
