# generated image name from this dockerfile: centos_base_for_syslog_ng
FROM centos:latest
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

ADD https://copr.fedoraproject.org/coprs/czanik/syslog-ng37/repo/epel-7/czanik-syslog-ng37-epel-7.repo /etc/yum.repos.d/
RUN yum update -y && yum install -y epel-release git

ADD centos_rpm_requirements.txt .
RUN cat centos_rpm_requirements.txt | grep -v "#" | xargs yum install -y

RUN git clone https://github.com/balabit/syslog-ng-docker.git
ENV SELF_BUILD_SCRIPT_DIR="/syslog-ng-docker/shared-resources/build-scripts/"
