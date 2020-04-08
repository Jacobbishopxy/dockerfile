# MongoDB Charts

For detailed information please visit official [instruction](https://docs.mongodb.com/charts/current/installation/).

## Setup Process

1. edit [`.env`](.env) file for configuration

1. pull docker images by [`setup-image.sh`](setup-image.sh)

1. enable docker swarm mode by [`docker-swarm-init.sh`](docker-swarm-init.sh)

1. test connection by [`test-connection.sh`](test-connection.sh)

1. create docker container by [`create-container.sh`](create-container.sh)

1. create charts users by [`create-charts-users.sh`](create-charts-users.sh)

1. backup charts installation keys by [`backup-keys.sh`](backup-keys.sh)


