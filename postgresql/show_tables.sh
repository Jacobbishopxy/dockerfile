#!/usr/bin/env bash

# -U <username> -d <database>
docker exec -it pgdb psql -U postgres -d postgres -c "
SELECT table_name
FROM information_schema.tables
WHERE table_schema='public'
AND table_type='BASE TABLE';"
