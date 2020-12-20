FROM debian:stable

RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt-get -y install apache2

ENV APACHE_SERVER_NAME localhost

CMD apache2ctl -D FOREGROUND
