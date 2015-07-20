#!/bin/bash -xe

cd / && git clone https://github.com/talien/grok.git && cd grok && autoreconf -i && ./configure && make && make install
