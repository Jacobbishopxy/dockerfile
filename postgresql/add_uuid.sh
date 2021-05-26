#!/usr/bin/env bash

source .env
export -a dbnames=${BASH_DATABASE_NAMES}
for i in "${dbnames[@]}"
do
docker exec -i pgdb psql -U postgres -d $i -c 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";'

done
