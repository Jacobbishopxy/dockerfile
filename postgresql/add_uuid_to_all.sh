#!/usr/bin/env bash
#this bash file is used for adding extension to all databases specified in .env
source .env
export -a dbnames=${BASH_DATABASE_NAMES}
for i in "${dbnames[@]}"
do
docker exec -i pgdb psql -U postgres -d $i -c 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";'

done
