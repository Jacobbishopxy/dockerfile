#!/usr/bin/env bash

source .env
export -a dbnames=${BASH_DATABASE_NAMES}
#case checking about pass in arguments
numArg=$#
if [ $numArg -ne 2 ];
then
    echo -n "Please enter the username to create: "
    read username
    if [ $numArg -lt 2 ];
    then 
        echo -n "Please enter the password for $username: "
        read password
    fi
#if there are more than 2 arguments, use the first two as user and password
else
    username=$1
    password=$2
fi
#if the password is an empty string, then use the default password
if [ -z $password ];
then
    password='infore'
    docker exec -i pgdb psql -U postgres << EOF
CREATE USER $username WITH PASSWORD '''$password''';
EOF
    echo "create $username with default password $password"
else
    docker exec -i pgdb psql -U postgres << EOF
CREATE USER $username with PASSWORD '''$password''';
EOF

fi
#loop through the set of names of database, and grant permission to the new created user
for i in "${dbnames[@]}"
do
    docker exec -i pgdb psql -U postgres << EOF
GRANT ALL ON DATABASE $i To $username;
EOF
done
