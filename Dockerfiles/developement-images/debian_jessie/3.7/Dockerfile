# generated image name from this dockerfile: debian_syslog_ng_dev_37
FROM balabit/debian_base_for_syslog_ng:latest
MAINTAINER Andras Mitzki <andras.mitzki@balabit.com>

ENV OSE_CORE_REPO_URL=https://github.com/balabit/syslog-ng.git
ENV OSE_CORE_BRANCH_NAME="master"
ENV OSE_INCUBATOR_REPO_URL=https://github.com/balabit/syslog-ng-incubator.git
ENV OSE_INCUBATOR_BRANCH_NAME="3.7/master"
ENV OTHER_CONFIGURE_OPTS="--with-python=2.7"

CMD ["./checkout_and_build_syslog_ng.sh"]
