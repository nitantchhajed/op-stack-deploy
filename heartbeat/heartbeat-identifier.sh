#!/bin/bash

#Check for health status

HEALTH_STATUS=$(curl -s http://172.22.68.224/health | jq -r '.healthy')

#check for current date and time log logs

CURRENT_DATE_TIME=$(date)

#check if status is true

if [ "$HEALTH_STATUS" == "true" ]; then
    echo "Service is healthy. No action needed. -- $CURRENT_DATE_TIME"
else
    echo "Service is not healthy, converting this node to Sequencer node -- $CURRENT_DATE_TIME"
    docker compose -p ./../r-testnet/cloudsigma/docker-compose.yml down op-node
    docker compose -p ./../r-testnet/cloudsigma/docker-compose.yml up sequencer-node op-batcher op-proposer
fi
