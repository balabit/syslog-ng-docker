# `balabit/syslog-ng-es-tls`
  * Syslog-ng 3.10.1 is installed with Elastic Search libraries on top of Alpine base.
  * Within the container syslog-ng will start in foreground. This is useful because if there is some error with syslog-ng we can easily check the output console log through the `docker logs [containerID]` command
  * You can set the following properties using environment variables

`ES_CLUSTER` - Elastic Search Cluster Name

`ES_SERVER` - Elastic Search Hostname or IP

`SYSLOG_TLS_PORT` - Syslog-NG TLS Port

`CERT_KEY_VALUE` - Contents of your Cert Key file

`CERT_VALUE` - Contents of your Cert file

`RUNTIME_ARGS` - Args for syslog-ng service. Defaults to `F` () options are listed below.

```bash
-F, –foreground Do not go into the background after initialization
-v, –verbose Be a bit more verbose
-d, –debug Enable debug messages
-t, –trace Enable trace messages
-e, –stderr Log messages to stderr
```

The following ports are exposed:
 * Syslog UDP: 514,
 * Syslog TCP: 601,
 * Syslog TLS: 6514

Syslog-ng will listen on these ports and forwards the logs into ElasticSearch creating and dated index syslog-ng-YYYY.MM.DD.

Please check the syslog-ng-es-tls image tags at the official docker repository to know what image versions exist  [https://registry.hub.docker.com/u/balabit]

## Using default configuration
Assume that the following ports are not used on host machine, because they can conflict: `514`, `601`, `6514`:

```bash
sudo docker run -it -p 514:514 -p 601:601 -p 6514:6514 -e ES_CLUSTER=logs -e ES_SERVER:elasticsearch -e SYSLOG_TLS_PORT=6514 -e CERT_KEY_VALUE=$(cat /etc/cert/cert.key) -e CERT_VALUE=$(cat /etc/cert/cert) --name syslog-ng balabit/syslog-ng-es-tls:latest
```

## Using debug options

```bash
sudo docker run -it -p 514:514 -p 601:601 -p 6514:6514 -e ES_CLUSTER=logs -e ES_SERVER:elasticsearch -e SYSLOG_TLS_PORT=6514 -e CERT_KEY_VALUE=$(cat /etc/cert/cert.key) -e CERT_VALUE=$(cat /etc/cert/cert) -e RUNTIME_ARGS=Fevd --name syslog-ng balabit/syslog-ng-es-tls:latest
```