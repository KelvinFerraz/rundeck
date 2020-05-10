#!/bin/bash

# Get Public IP 
HOSTNAME_RUNDECK=$(curl ifconfig.me)

# SHARE Public IP Geted to env file
echo "HOSTNAME_RUNDECK=${HOSTNAME_RUNDECK}" >> .env


# Exec compose
docker-compose up -d
