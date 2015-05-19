# generated image name from this dockerfile: debian_syslog_ng_dev_36
FROM balabit/debian_base_for_syslog_ng:latest
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

ENV BRANCH_NAME="3.6/master"
RUN . ${SELF_BUILD_SCRIPT_DIR}/setup_environment_variables.sh && ${SELF_BUILD_SCRIPT_DIR}/checkout_and_build_syslog_ng.sh

ENV INCUBATOR_BRANCH_NAME="master"
RUN . ${SELF_BUILD_SCRIPT_DIR}/setup_environment_variables.sh && ${SELF_BUILD_SCRIPT_DIR}/checkout_and_build_syslog_ng_incubator.sh

CMD ["/opt/syslog-ng/sbin/syslog-ng", "-Fedv"]
