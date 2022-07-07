FROM openjdk:11.0.15-jre

WORKDIR /app

RUN wget https://archive.apache.org/dist/incubator/seatunnel/2.1.2/apache-seatunnel-incubating-2.1.2-bin.tar.gz
RUN wget https://archive.apache.org/dist/spark/spark-2.4.8/spark-2.4.8-bin-hadoop2.7.tgz

RUN tar xf apache-seatunnel-incubating-2.1.2-bin.tar.gz
RUN tar xf spark-2.4.8-bin-hadoop2.7.tgz

RUN wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.29/mysql-connector-java-8.0.29.jar
RUN wget https://repo1.maven.org/maven2/org/postgresql/postgresql/42.4.0/postgresql-42.4.0.jar
RUN mv mysql-connector-java-8.0.29.jar /app/spark-2.4.8-bin-hadoop2.7/jars
RUN mv postgresql-42.4.0.jar /app/spark-2.4.8-bin-hadoop2.7/jars

ENV SPARK_HOME=/app/spark-2.4.8-bin-hadoop2.7

EXPOSE 8080

VOLUME ./jobs /app/jobs


