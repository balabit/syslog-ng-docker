# generated image name from this dockerfile: centos_syslog_ng_dev_36
FROM balabit/centos_base_for_syslog_ng:latest
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

ENV BRANCH_NAME="3.6/master"
ENV OTHER_CONFIGURE_OPTS="--disable-systemd"
RUN ./checkout_and_build_syslog_ng.sh

ENV INCUBATOR_BRANCH_NAME="master"
RUN ./checkout_and_build_syslog_ng_incubator.sh

CMD ["/opt/syslog-ng/sbin/syslog-ng", "-Fedv"]
