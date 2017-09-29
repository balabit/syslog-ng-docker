#!/bin/sh

# Copy var values into key and cert files

export LD_LIBRARY_PATH=/usr/lib/jvm/java-1.8-openjdk/jre/lib/amd64/server:$LD_LIBRARY_PATH

sed -i "s/ES_SERVER/$ES_SERVER/g" /etc/syslog-ng/syslog-ng.conf
sed -i "s/ES_CLUSTER/$ES_CLUSTER/g" /etc/syslog-ng/syslog-ng.conf

if [ -z "$RUNTIME_ARGS" ]; then
  export RUNTIME_ARGS="F"
fi

exec /usr/sbin/syslog-ng -$RUNTIME_ARGS -f /etc/syslog-ng/syslog-ng.conf