#!/bin/bash


# Variables
EXIST_HOSTNAME=$(cat .env | grep -o HOSTNAME_RUNDECK)

if [ -z $EXIST_HOSTNAME ];then
    # # Exec compose
    docker-compose up -d
else
    # # Get Public IP 
    HOSTNAME_RUNDECK=$(curl ifconfig.me)

    # # SHARE Public IP Geted to env file
    echo "HOSTNAME_RUNDECK=${HOSTNAME_RUNDECK}" > .env

    # # Exec compose
    docker-compose up -d
fi
