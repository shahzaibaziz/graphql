#!/bin/bash

if [ "$(docker ps -a -q -f name=idP-db)" ]; then
  docker rm -f idP-db
fi
