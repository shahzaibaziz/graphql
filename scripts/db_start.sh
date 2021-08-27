#!/bin/bash

docker run -d --name idP-db  -e MYSQL_ROOT_PASSWORD=myproject123 -p 3306:3306 mysql:5.7
sleep 30 # waiting for db container
