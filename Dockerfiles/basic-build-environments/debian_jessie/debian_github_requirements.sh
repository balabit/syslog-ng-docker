#!/bin/bash -xe

git clone https://github.com/talien/grok.git /libgrok && \
    cd /libgrok && \
    git pull && \
    autoreconf -i && \
    ./configure && \
    make && \
    make install
