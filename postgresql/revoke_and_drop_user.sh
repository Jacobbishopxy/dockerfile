#!/usr/bin/env bash
#this file is mainly for testing create_user_and_grant.sh
#it takes in the name of an user, revokes all of the privileges,
#and then drop the user
source .env
export -a dbnames=${BASH_DATABASE_NAMES}

numArg=$#
if [ $numArg -ne 2 ];
then
    echo -n "Please enter the username to drop: "
    read username
    if [ $numArg -lt 2 ];
    then 
        echo -n "Please enter the password for $username: "
        read password
    fi
else
    username=$1
    password=$2
fi

for i in "${dbnames[@]}"
do
    docker exec -i pgdb psql -U postgres << EOF
REVOKE ALL ON DATABASE $i FROM $username;
EOF

if [ -z $password ];
then
    password='infore'
    docker exec -i pgdb psql -U postgres << EOF
DROP USER IF EXISTS $username;
EOF
    echo "drop $username with default password $password"
else
    docker exec -i pgdb psql -U postgres << EOF
DROP USER IF EXISTS $username;
EOF

fi


done