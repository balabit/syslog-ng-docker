# generated image name from this dockerfile: debian_base_for_syslog_ng
FROM debian:latest
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

RUN apt-get update && apt-get install -y git

ADD debian_apt_requirements.txt .
RUN cat debian_apt_requirements.txt | grep -v "#" | xargs apt-get install -y

ADD debian_pip_requirements.txt .
RUN cat debian_pip_requirements.txt | grep -v "#" | xargs pip install

ADD debian_github_requirements.sh .
RUN ./debian_github_requirements.sh

RUN git clone https://github.com/balabit/syslog-ng-docker.git
ENV SELF_BUILD_SCRIPT_DIR="/syslog-ng-docker/shared-resources/build-scripts/"
