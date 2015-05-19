# generated image name from this dockerfile: ubuntu_base_for_syslog_ng
FROM ubuntu:latest
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

RUN apt-get update && apt-get install -y git

ADD ubuntu_apt_requirements.txt .
RUN cat ubuntu_apt_requirements.txt | grep -v "#" | xargs apt-get install -y

ADD ubuntu_pip_requirements.txt .
RUN cat ubuntu_pip_requirements.txt | grep -v "#" | xargs pip install

ADD ubuntu_github_requirements.sh .
RUN ./ubuntu_github_requirements.sh

RUN git clone https://github.com/mitzkia/syslog-ng-ose-docker-new.git
ENV SELF_BUILD_SCRIPT_DIR="/syslog-ng-ose-docker-new/shared-resources/build-scripts/"
