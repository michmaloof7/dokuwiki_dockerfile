FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y apache2
RUN service apache2 start
RUN apt-get install -y php php7.0-xml libapache2-mod-php
EXPOSE 80
COPY --chown=www-data ./dokuwiki /var/www/html/
RUN rm /var/www/html/index.php
CMD apache2ctl -D FOREGROUND
