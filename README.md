# Dockerfile

A collection of docker files I used in my daily routine.

## Category

1. [dgraph](dgraph/README.md)

1. [docker-app-nodejs](docker-app-nodejs/README.md)

1. [docker-app-python](docker-app-python/README.md)

1. [docker-app-scala](docker-app-scala/README.md)

1. [grafana](grafana/README.md)

1. [indluxdb](influxdb/README.md)

1. [java8](java8/)

1. [mongodb](mongodb/README.md)

1. [mongodb-charts](mongodb-charts/README.md)

1. [mongodb-express](mongodb-express/README.md)

1. [mysql](mysql/)

1. [nexus](nexus/README.md)

1. [nginx](nginx/README.md)

1. [pgadmin4](pgadmin4/README.md)

1. [postgresql](postgresql/README.md)

## Docker installation

1. follow [official manual](https://docs.docker.com/engine/install/ubuntu)

1. grant permission to current user:
   `sudo usermod -aG docker $USER`

1. [optional] add line `export PATH=/home/$USER/bin:$PATH` to ~/.bashrc, then `source ~/.bashrc` (including next step is for wsl user manually startup)

1. [optional] add `docker-service` script to ~/bin directory then `chmod +x docker-service`:

   ```sh docker-service
   DOCKER_DISTRO="Ubuntu-18.04"
   DOCKER_DIR=/mnt/wsl/shared-docker
   DOCKER_SOCK="$DOCKER_DIR/docker.sock"
   export DOCKER_HOST="unix://$DOCKER_SOCK"
   if [ ! -S "$DOCKER_SOCK" ]; then
       mkdir -pm o=,ug=rwx "$DOCKER_DIR"
       chgrp docker "$DOCKER_DIR"
       /mnt/c/Windows/System32/wsl.exe -d $DOCKER_DISTRO sh -c "nohup sudo -b dockerd < /dev/null > $DOCKER_DIR/dockerd.log 2>&1"
   fi
   ```

1. Logout & Login

1. [optional] startup run (not for wsl user): `sudo systemctl restart docker`

1. install docker compose by [official manual](https://docs.docker.com/compose/install/)
