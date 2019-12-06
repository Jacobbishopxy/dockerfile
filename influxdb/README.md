# Grafana + InfluxDB Monitoring System

### Prerequisites

- Docker-CE 17.12+
- Docker Compose v1.21.0+

### Usage

    $ $env:COMPOSE_CONVERT_WINDOWS_PATHS=1

    $ docker-compose pull

    $ docker-compose up -d

    $ open http://localhost:3000

### Install Gragana plugins

```bash
$ docker exec -it demo_grafana_1 bash

$ grafana-cli plugins install petrslavotinek-carpetplot-panel
```


### FAQ

#### [InfluxDB] How do I check running InfluxDB's version?

```bash
$ docker exec -it demo_influxdb_1  influx  -version
```

```bash
docker logs -f test_influxdb_1
```

#### [Grafana] Why is InfluxDB datasource doesn't work?

manual create database is still required

```bash
$ docker exec -it demo_influxdb_1
    influx
      -username admin
      -password admin
      -execute 'CREATE DATABASE demo;'

$ docker exec -it demo_influxdb_1
    influx
      -username admin
      -password admin
      -execute 'SHOW DATABASES;'
```

### Create user and grant roles

```bash
influx -username admin -password admin
# CREATE USER "reader" WITH PASSWORD 'reader'
# GRANT [READ, WRITE, ALL] ON test TO "reader"
```

### Docker Images

- [Grafana v5.1.2][docker-image-grafana]
- [InfluxDB 1.5.2][docker-image-influxdb]

[docker-image-influxdb]: https://hub.docker.com/_/influxdb/
[docker-image-grafana]: https://hub.docker.com/r/grafana/grafana/


### Note

* Checking file size
    
    ```
    ls -l filename /* Size of the file*/
    ls -l *        /* Size of All the files in the current directory */
    ls -al *       /* Size of All the files including hidden files in the current directory */
    ls -al dir/    /* Size of All the files including hidden files in the 'dir' directory */
    ```

* Checking directory sizes

    ```
    du -sh directory_name    /* Gives you the summarized(-s) size of the directory in human readable(-h) format*/
    du -bsh *                /* Gives you the apparent(-b) summarized(-s) size of all the files and directories in the current directory in human readable(-h) format*/
    ```


