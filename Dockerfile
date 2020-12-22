FROM debian:stable-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade

RUN apt-get -y install apache2

ADD --chown=root:root ./etc/apache2/apache2.conf /etc/apache2/apache2.conf
RUN chmod 644 /etc/apache2/apache2.conf

RUN apt-get update && apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    lsb-release \
    unzip

RUN curl -s https://packages.sury.org/php/apt.gpg | apt-key add -

ADD --chown=root:root ./etc/apt/sources.list /etc/apt/sources.list
RUN chmod 644 /etc/apt/sources.list

RUN apt-get update && apt-get -y install \
    php5.6 \
    php5.6-curl \
    php5.6-mbstring \
    php5.6-mysql \
    php5.6-xml \
    php5.6-xdebug \
    php5.6-zip

ADD --chown=root:root ./etc/php/5.6/apache2/php.ini /etc/php/5.6/apache2/php.ini
RUN chmod 644 /etc/php/5.6/apache2/php.ini

RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer diagnose

RUN a2dissite 000-default

RUN mkdir -pv /etc/apache2/sites-available/.default
RUN mv -v /etc/apache2/sites-available/*.conf /etc/apache2/sites-available/.default/

RUN a2enmod rewrite

RUN chown -Rv www-data:www-data /var/www

CMD apache2ctl -D FOREGROUND
