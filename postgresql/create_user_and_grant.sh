#!/usr/bin/env bash

source .env
export -a dbnames=${BASH_DATABASE_NAMES}

if [ $# -ne 1 ];
then
    echo "Please input the username to create: "
    read username
else
    username=$1
fi

docker exec -i pgdb psql -U postgres << EOF
CREATE USER $username;
EOF

for i in "${dbnames[@]}"
do
    docker exec -i pgdb psql -U postgres << EOF
GRANT ALL ON DATABASE $i To $username;
EOF
done

