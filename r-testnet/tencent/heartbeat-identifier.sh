#!/bin/bash

#Check for health status

HEALTH_STATUS_CS=$(curl -s http://178.22.68.224/health | jq -r '.healthy')

HEALTH_STATUS_AWS=$(curl -s http://racetestnet.io/health | jq -r '.healthy')

#check for current date and time log logs

CURRENT_DATE_TIME=$(date)

#check if status is true

if [ "$HEALTH_STATUS_CS" == "true" ] && [ "$HEALTH_STATUS_AWS" == "true" ]; then
    echo "Both AWS and CloudSigma are healthy. No action needed. -- $CURRENT_DATE_TIME"
fi

if [ "$HEALTH_STATUS_CS" == "false" ] && [ "$HEALTH_STATUS_AWS" == "true" ]; then
    echo "CloudSigma is Down and AWS is healthy. Bring up CLoudSigma. -- $CURRENT_DATE_TIME"
fi

if [ "$HEALTH_STATUS_CS" == "false" ] && [ "$HEALTH_STATUS_AWS" == "false" ]; then
    echo "CloudSigma and AWS are down. Bring up CloudSigma.  converting Tencent node into Sequencer -- $CURRENT_DATE_TIME"

    #Bringing down Validator node
    docker compose down op-node

    #Bringing up Sequencer node
    docker compose up sequencer-node op-batcher op-proposer
fi
