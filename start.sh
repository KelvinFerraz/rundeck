#!/bin/bash

if [ -e .env ]; then
    
    # Variables
    EXIST_HOSTNAME=$(cat .env | grep -o HOSTNAME_RUNDECK)

else
    
    touch .env

    # Get Public IP
    HOSTNAME_RUNDECK=$(curl ifconfig.me)

    # SHARE Public IP Geted to env file
    echo "HOSTNAME_RUNDECK=${HOSTNAME_RUNDECK}" > .env

fi


if [ -z $EXIST_HOSTNAME ];then
    # Exec compose
    docker-compose up -d
else
    # Get Public IP 
    HOSTNAME_RUNDECK=$(curl ifconfig.me)

    # SHARE Public IP Geted to env file
    echo "HOSTNAME_RUNDECK=${HOSTNAME_RUNDECK}" > .env

    # Exec compose
    docker-compose up -d
fi
