#!/usr/bin/env bash

docker exec -it seatunnel /app/apache-seatunnel-incubating-2.1.2/bin/start-seatunnel-spark.sh --master 'local[4]' --deploy-mode client --config \
 /app/jobs/spark.batch.conf.template
