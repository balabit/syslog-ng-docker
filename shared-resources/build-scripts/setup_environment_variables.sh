#!/bin/bash

export WORKING_DIR='/working_dir/'
export INSTALL_DIR='/opt/syslog-ng/'
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:${INSTALL_DIR}/lib/pkgconfig:/usr/local/lib/pkgconfig/

export OSE_SOURCE_DIR='syslog-ng-src'
export OSE_GIT_REPO='https://github.com/balabit/syslog-ng.git'

export INCUBATOR_SOURCE_DIR='syslog-ng-incubator-src'
export INCUBATOR_GIT_REPO='https://github.com/balabit/syslog-ng-incubator.git'
