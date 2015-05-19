FROM ubuntu:latest
MAINTAINER Andras Mitzki

RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common
RUN add-apt-repository ppa:webupd8team/java
# for auto accept license during the installation
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

RUN apt-get update && apt-get install -y supervisor oracle-java8-installer oracle-java8-set-default curl
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/lib/jvm/java-8-oracle/jre/lib/amd64/server/:/usr/local/lib/

ENV KAFKA_VERSION 0.8.2.0
ENV SCALA_VERSION 2.10
RUN curl -L http://xenia.sote.hu/ftp/mirrors/www.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz | tar xfz -

RUN mv /kafka_${SCALA_VERSION}-${KAFKA_VERSION} /kafka

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
