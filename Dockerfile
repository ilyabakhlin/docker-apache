FROM debian:stable

RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrate

RUN apt-get -y install apache2
