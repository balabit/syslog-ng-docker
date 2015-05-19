#!/bin/bash -xe

if [ ${BRANCH_NAME}=master ] ; then
  git clone -b ${INCUBATOR_BRANCH_NAME} ${INCUBATOR_GIT_REPO} ${INCUBATOR_SOURCE_DIR}
  cd ${INCUBATOR_SOURCE_DIR}
  git pull
  autoreconf -i
  mkdir build_dir && cd build_dir && mkdir -p ${INSTALL_DIR}
  ../configure \
    --prefix=${INSTALL_DIR}
  make
  make install
else
  echo "syslog-ng OSE incubator not supported with this OSE version: ${BRANCH_NAME}, it will be not downloaded, installed."
fi
