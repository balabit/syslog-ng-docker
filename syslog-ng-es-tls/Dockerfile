FROM alpine:3.3

# Install openjdk8

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

# add a simple script that can auto-detect the appropriate JAVA_HOME value
# based on whether the JDK or only the JRE is installed
RUN { \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
		echo; \
		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
	} > /usr/local/bin/docker-java-home \
	&& chmod +x /usr/local/bin/docker-java-home
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

ENV JAVA_VERSION 8u92
ENV JAVA_ALPINE_VERSION 8.92.14-r0

RUN set -x \
	&& apk add --no-cache \
		openjdk8="$JAVA_ALPINE_VERSION" \
	&& [ "$JAVA_HOME" = "$(docker-java-home)" ]

# Install Gradle to build syslog-ng with Java libs

RUN mkdir /usr/lib/gradle /app

ENV GRADLE_VERSION 2.13
ENV GRADLE_HOME /usr/lib/gradle/gradle-${GRADLE_VERSION}
ENV PATH ${PATH}:${GRADLE_HOME}/bin

WORKDIR /usr/lib/gradle
RUN set -x; \
    apk add --no-cache wget && \
    wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip gradle-${GRADLE_VERSION}-bin.zip && \
    rm gradle-${GRADLE_VERSION}-bin.zip && \
    apk del wget

ENV SYSLOG_VERSION=3.10.1
ENV DOWNLOAD_URL="https://github.com/balabit/syslog-ng/releases/download/syslog-ng-${SYSLOG_VERSION}/syslog-ng-${SYSLOG_VERSION}.tar.gz"

# Configuration options here:
# https://github.com/balabit/syslog-ng/blob/master/configure.ac

RUN apk --no-cache add --virtual .devDeps \
    curl \
	bash \
    alpine-sdk \
    glib-dev \
    pcre-dev \
    openssl-dev \
    libeventlog-dev \
    json-c-dev && \
    cd /tmp && \
    curl -L "${DOWNLOAD_URL}" > "syslog-ng-${SYSLOG_VERSION}.tar.gz" && \
    tar zxf "syslog-ng-${SYSLOG_VERSION}.tar.gz" && \
    cd "syslog-ng-${SYSLOG_VERSION}" && \
    ./configure \
    --prefix=/usr \
    --enable-mongodb=no \
    --enable-json=yes \
    --with-mongoc=no \
    --enable-legacy-mongodb-options=no && \
    make && \
    make install && \
    cd .. && \
    rm -rf "syslog-ng-${SYSLOG_VERSION}" "syslog-ng-${SYSLOG_VERSION}.tar.gz" && \
    apk del .devDeps

# Download and extract ElasticSearch libraries for use by syslog-ng as destination

# https://artifacts.elastic.co/GPG-KEY-elasticsearch
ENV GPG_KEY 46095ACC8548582C1A2699A9D27D666CD88E42B4

ENV ELASTICSEARCH_VERSION 2.4.3
ENV ELASTICSEARCH_TARBALL="https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-2.4.2.tar.gz" \
      ELASTICSEARCH_TARBALL_ASC="https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-2.4.2.tar.gz.asc" \
      ELASTICSEARCH_TARBALL_SHA1="25effa2daacf5ba65151103dd47339fd88826756"

WORKDIR /opt/elasticsearch/lib/

RUN set -ex; \
	\
	apk add --no-cache --virtual .fetch-deps \
		ca-certificates \
		gnupg \
        openssl \
		tar \
	; \
	\
	wget -O elasticsearch.tar.gz "$ELASTICSEARCH_TARBALL"; \
	\
	if [ "$ELASTICSEARCH_TARBALL_SHA1" ]; then \
		echo "$ELASTICSEARCH_TARBALL_SHA1 *elasticsearch.tar.gz" | sha1sum -c -; \
	fi; \
	\
	if [ "$ELASTICSEARCH_TARBALL_ASC" ]; then \
		wget -O elasticsearch.tar.gz.asc "$ELASTICSEARCH_TARBALL_ASC"; \
		export GNUPGHOME="$(mktemp -d)"; \
		gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$GPG_KEY"; \
		gpg --batch --verify elasticsearch.tar.gz.asc elasticsearch.tar.gz; \
		rm -r "$GNUPGHOME" elasticsearch.tar.gz.asc; \
	fi; \
	\
	tar -zxvf elasticsearch.tar.gz --wildcards --no-anchored '*.jar'; \
	rm elasticsearch.tar.gz; \
	\
	apk del .fetch-deps;

RUN apk add --update \
    busybox \
    musl \
    eventlog \
	glib \
	hiredis \
	json-c \
	pcre && \
    rm -rf /var/cache/apk/*

# Copy static files to container

COPY syslog-ng.conf /etc/syslog-ng/
COPY ./docker-entrypoint.sh /

# Add and configure syslog-ng User

RUN chmod +x /docker-entrypoint.sh && \
    mkdir -p /etc/syslog-ng/cert.d

WORKDIR /

# Expose syslog-ng required ports

EXPOSE 514/udp
EXPOSE 601/tcp
EXPOSE 6514/tcp

ENTRYPOINT ["/docker-entrypoint.sh"]