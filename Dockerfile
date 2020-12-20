FROM debian:stable

RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt-get -y install apache2

ADD --chown=root:root ./etc/apache2/apache2.conf /etc/apache2/apache2.conf
RUN chmod -v 644 /etc/apache/apache2.conf

ENV APACHE_SERVER_NAME localhost

CMD apache2ctl -D FOREGROUND
