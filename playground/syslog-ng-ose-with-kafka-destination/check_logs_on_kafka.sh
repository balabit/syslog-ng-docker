#!/bin/bash -xe
sudo docker exec -it $(sudo docker ps | grep 'kafka_destination' | awk '{print $1}') /kafka/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic test --from-beginning
