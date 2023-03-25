from elasticsearch import Elasticsearch
import logging

# Initialize Elasticsearch client
es = Elasticsearch([{'host': '54.180.83.124', 'port': 9200, 'scheme': 'http'}])

# Set up logging
logging.basicConfig(filename='myapp.log', level=logging.INFO, format='%(asctime)s %(levelname)s %(message)s')

# Read log file and send logs to Elasticsearch
with open('log_mqtt.log.20220704', 'r') as f:
    for line in f:
        # Log data to Elasticsearch
        es.index(index='myapp-logs', document={'message': line.strip()})
        print(line.strip())

# Close Elasticsearch connection
es.transport.close()
