# generated image name from this dockerfile: centos_syslog_ng_dev_37
FROM mitzkia/centos_base_for_syslog_ng:latest
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

ENV BRANCH_NAME="master"
ENV OTHER_CONFIGURE_OPTS="--with-python=2.7"
RUN . ${SELF_BUILD_SCRIPT_DIR}/setup_environment_variables.sh && ${SELF_BUILD_SCRIPT_DIR}/checkout_and_build_syslog_ng.sh

ENV INCUBATOR_BRANCH_NAME="3.7/master"
RUN . ${SELF_BUILD_SCRIPT_DIR}/setup_environment_variables.sh && ${SELF_BUILD_SCRIPT_DIR}/checkout_and_build_syslog_ng_incubator.sh

CMD ["/opt/syslog-ng/sbin/syslog-ng", "-Fedv"]
