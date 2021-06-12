# 1.0.0 #

## Added ##

* Replacing the `sources.list` file at `/etc/apt/` directory.
* Updating and upgrading the operating system.
* The Apache 2 web server installation.
* Removing all the default Apache's log files at the `/var/log/apache2/` directory.
* Replacing the `apache.conf` file at the `/etc/apache2/` directory with basic configuration.
* Replacing the `security.conf` file at the `/etc/apache2/conf-available/` directory with basic configuration.
* Disabling of the `000-default` virtual host.
* Creating the `.default/` directory at `/etc/apache/sites-available/` directory.
* Moving all the configuration files at `/etc/apache/sites-available/` directory to the `/etc/apache/sites-available/.default/` one.
* Removing the `/var/www/html/` directory.
* Setting the ownership of the `/var/www/` directory to `www-data:www-data`.
