#!/bin/bash -xe

git clone -b ${BRANCH_NAME} https://github.com/balabit/syslog-ng.git /syslog-ng-src
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
