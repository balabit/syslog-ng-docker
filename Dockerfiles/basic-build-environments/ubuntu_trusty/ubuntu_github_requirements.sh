#!/bin/bash -xe

cd / && git clone https://github.com/talien/grok.git && cd grok && autoreconf -i && ./configure && make && make install

apt-get install -y curl unzip
cd / && git clone https://github.com/google/protobuf.git && cd protobuf && ./autogen.sh && ./configure && make && make install
cd / && git clone https://github.com/protobuf-c/protobuf-c.git && cd protobuf-c && ./autogen.sh && ./configure && make && make install
cd / && git clone https://github.com/algernon/riemann-c-client.git && cd riemann-c-client && autoreconf -i && ./configure && make && make install
