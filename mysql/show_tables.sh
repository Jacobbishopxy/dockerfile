#!/usr/bin/env bash

# -u<username> -p<password> -D <database>
docker exec -it mysql mysql -uroot -pqweqwe123 -D db -e "
show tables;
"
