FROM debian:stable-slim

ARG DEBIAN_FRONTEND=noninteractive

ADD --chown=root:root ./etc/apt/sources.list /etc/apt/sources.list
RUN chmod 644 /etc/apt/sources.list

RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt-get update && apt-get -y install apache2

RUN rm -frv /var/log/apache2/*.log

ADD --chown=root:root ./etc/apache2/apache2.conf /etc/apache2/apache2.conf
RUN chmod 644 /etc/apache2/apache2.conf

ADD --chown=root:root ./etc/apache2/conf-available/security.conf /etc/apache2/conf-available/security.conf
RUN chmod 644 /etc/apache2/conf-available/security.conf

RUN a2dissite 000-default

RUN mkdir -pv /etc/apache2/sites-available/.default
RUN mv -v /etc/apache2/sites-available/*.conf /etc/apache2/sites-available/.default/

RUN rm -frv /var/www/html

RUN chown -Rv www-data:www-data /var/www

CMD apache2ctl -D FOREGROUND
