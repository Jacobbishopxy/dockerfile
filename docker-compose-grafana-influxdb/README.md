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


### Docker Images

- [Grafana v5.1.2][docker-image-grafana]
- [InfluxDB 1.5.2][docker-image-influxdb]

[docker-image-influxdb]: https://hub.docker.com/_/influxdb/
[docker-image-grafana]: https://hub.docker.com/r/grafana/grafana/
