#!/bin/bash

# Update system and install packages
apt update
apt-get update
apt-get dist-upgrade -qy

# install elasticsearch
apt install elasticsearch

# install kibana
apt-get install kibana

# install logstash
apt-get install logstash

# install filebeat
apt-get install filebeat

# install metricbeat
apt-get install metricbeat

# set up config files for Elasticsearch, Kibana, and Logstash
echo "network.host: 0.0.0.0" >>  /etc/elasticsearch/elasticsearch.yml
echo "server.host: 0.0.0.0" >> /etc/kibana/kibana.yml
cp 10-logstash.conf /etc/logstash/conf.d/

# Manage services with update-rc.d
update-rc.d elasticsearch defaults 95 10
update-rc.d kibana defaults 95 10
update-rc.d logstash defaults 95 10

# Manage services with systemctl
systemctl daemon-reload
systemctl enable elasticsearch.service
systemctl enable kibana.service
systemctl enable logstash.service
