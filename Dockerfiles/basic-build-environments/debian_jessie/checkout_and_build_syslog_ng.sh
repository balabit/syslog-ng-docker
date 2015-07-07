#!/bin/bash -xe

git clone -b ${BRANCH_NAME} ${BRANCH_URL} /syslog-ng-src
cd /syslog-ng-src
git pull
./autogen.sh
mkdir build_dir && cd build_dir && mkdir -p ${INSTALL_DIR}
../configure \
    --enable-debug \
    --enable-all-modules \
    --disable-sun-streams \
    --with-libmongo-client=internal \
    --with-jsonc=internal \
    --with-librabbitmq-client=internal \
    --with-ivykis=internal \
    --prefix=${INSTALL_DIR} \
    ${OTHER_CONFIGURE_OPTS}

make
make install

if [ ${BRANCH_NAME}=master ] ; then
  git clone -b ${INCUBATOR_BRANCH_NAME} https://github.com/balabit/syslog-ng-incubator.git /syslog-ng-incubator-src
  cd /syslog-ng-incubator-src
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

/opt/syslog-ng/sbin/syslog-ng -Fedv
