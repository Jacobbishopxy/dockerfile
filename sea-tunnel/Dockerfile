FROM openjdk:11.0.15-jre

WORKDIR /app

RUN wget https://archive.apache.org/dist/incubator/seatunnel/2.1.2/apache-seatunnel-incubating-2.1.2-bin.tar.gz
RUN wget https://archive.apache.org/dist/spark/spark-2.4.8/spark-2.4.8-bin-hadoop2.7.tgz

RUN tar xf apache-seatunnel-incubating-2.1.2-bin.tar.gz
RUN tar xf spark-2.4.8-bin-hadoop2.7.tgz
ENV SPARK_HOME=/app/spark-2.4.8-bin-hadoop2.7

EXPOSE 8080

VOLUME ./jobs /app/jobs


