#!/bin/bash

# Update system and install packages
apt-get update
apt-get dist-upgrade -qy
apt-get install wget gnupg2 apt-transport-https openjdk-8-jre-headless apt-utils curl procps vim -qy

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list

apt-get update && apt-get install -qy elasticsearch kibana logstash


# set up config files for Elasticsearch, Kibana, and Logstash
echo "network.host: 0.0.0.0" >>  /etc/elasticsearch/elasticsearch.yml
echo "server.host: 0.0.0.0" >> /etc/kibana/kibana.yml
cp 10-logstash.conf /etc/logstash/conf.d/

# Manage services with update-rc.d
update-rc.d elasticsearch defaults 95 10
update-rc.d kibana defaults 95 10
update-rc.d logstash defaults 95 10

# Manage services with systemctl
#systemctl daemon-reload
#systemctl enable elasticsearch.service
#systemctl enable kibana.service
#systemctl enable logstash.service
