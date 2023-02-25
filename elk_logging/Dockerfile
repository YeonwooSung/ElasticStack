FROM ubuntu:latest
LABEL maintainer="Yeonwoo Sung"

# Set the working directory to /app
WORKDIR /app
# Copy the current directory contents into the container at /app
ADD . /app

# Make port 9200 available outside this container
EXPOSE 9200

# run setup_elk.sh
RUN bash setup_elk.sh

ENTRYPOINT systemctl start elasticsearch && systemctl start kibana && systemctl start logstash && tail -f /var/log/elasticsearch/elasticsearch.log
