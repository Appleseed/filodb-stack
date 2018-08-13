#This is a docker image to install cassandra and configure it, then add spark to it, then finally spark.
#For environment add git, java 1.8 and scala 2.11
FROM ubuntu 
MAINTAINER tejasvi.sharma@nant.us

RUN apt-get update 
RUN apt-get -y install  git
RUN apt-get -y install wget
#In future image will get this from some link instead of copying from local

COPY apache-cassandra-3.11.2-bin.tar.gz / 
COPY  spark-2.0.0-bin-hadoop2.7.tgz /home/
COPY  jdk-8u91-linux-x64.tar.gz /home/
COPY  scala-2.10.6.tgz /home/

#Extracting the data
RUN tar -xvf apache-cassandra-3.11.2-bin.tar.gz 
RUN tar -xvf  /home/spark-2.0.0-bin-hadoop2.7.tgz 
RUN tar -xvf  /home/jdk-8u91-linux-x64.tar.gz 
RUN tar -xvf /home/scala-2.10.6.tgz

#removing the tar files
RUN rm apache-cassandra-3.11.2-bin.tar.gz
RUN rm /home/spark-2.0.0-bin-hadoop2.7.tgz
RUN rm /home/jdk-8u91-linux-x64.tar.gz
RUN rm /home/scala-2.10.6.tgz

#renaming folders
RUN mv scala-2.10.6 scala
RUN mv jdk1.8.0_91  java
RUN mv apache-cassandra-3.11.2 cassandra
RUN mv spark-2.0.0-bin-hadoop2.7 spark2.0

#creating directory for logs and data in cassandra
RUN mkdir cassandra/logs
RUN mkdir cassandra/data

#setting the environment variables
RUN echo "JAVA_HOME='/java'" >> ~/.bashrc
RUN echo "SCALA_HOME='/scala'" >> ~/.bashrc

ENV PATH $PATH:/java/bin
ENV PATH $PATH:/scala/bin 
ENV PATH $PATH:/cassandra/bin

#getting and Installing sbt
RUN apt-get -y install curl
#Installing SBT
ENV SBT_VERSION 1.2.1
RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get -y install sbt && \
  sbt sbtVersion

RUN git clone https://github.com/filodb/FiloDB.git
