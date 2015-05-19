FROM ubuntu:latest
MAINTAINER Andras Mitzki

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx curl openjdk-7-jre-headless supervisor

# download+install kibana
ENV KIBANA_VERSION 3.1.2
RUN curl -L https://download.elasticsearch.org/kibana/kibana/kibana-${KIBANA_VERSION}.tar.gz | tar xfz -
RUN mv kibana-${KIBANA_VERSION} /kibana && cp -r /kibana /usr/share/

# configure nginx
ADD default /etc/nginx/sites-enabled/default

# download+install+configure elasticsearch
ENV ELASTICSEARCH_VERSION 1.4.4
RUN curl -L https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz | tar xfz -
RUN mv /elasticsearch-${ELASTICSEARCH_VERSION} /elasticsearch
RUN echo 'http.cors.allow-origin: "/.*/"' >> /elasticsearch/config/elasticsearch.yml
RUN echo 'http.cors.enabled: true' >> /elasticsearch/config/elasticsearch.yml

EXPOSE 9300
EXPOSE 9200
EXPOSE 80

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
