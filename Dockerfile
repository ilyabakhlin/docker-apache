FROM debian:stable

RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt-get -y install apache2

ADD --chown=root:root ./etc/apache2/apache2.conf /etc/apache2/apache2.conf
RUN chmod 644 /etc/apache2/apache2.conf

RUN apt-get update && apt-get -y install curl gnupg2 ca-certificates lsb-release apt-transport-https

RUN curl -s https://packages.sury.org/php/apt.gpg | apt-key add -

ADD --chown=root:root ./etc/apt/sources.list /etc/apt/sources.list
RUN chmod 644 /etc/apt/sources.list

CMD apache2ctl -D FOREGROUND
