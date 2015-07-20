#!/bin/bash -xe

git clone -b ${OSE_CORE_BRANCH_NAME} ${OSE_CORE_REPO_URL} /syslog-ng-src
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

if [ ${OSE_CORE_BRANCH_NAME}=master ] || [ ${OSE_CORE_BRANCH_NAME}=3.6/master ] ; then
  git clone -b ${OSE_INCUBATOR_BRANCH_NAME} ${OSE_INCUBATOR_REPO_URL} /syslog-ng-incubator-src
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
