#!/bin/bash

if [ "$CONFIG_FILE" == "config_example.json" ] && [ ! -f "/config/config_example.json" ]
then
    echo "Copying config_example.json to /config/"
    cp /config_example.json /config/
fi

t-rex -c /config/$CONFIG_FILE