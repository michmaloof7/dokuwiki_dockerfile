FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y apache2
RUN service apache2 start
RUN apt-get install -y php php7.0-xml libapache2-mod-php
EXPOSE 80
RUN apt-get install -y wget
RUN wget https://download.dokuwiki.org/out/dokuwiki-8a269cc015a64b40e4c918699f1e1142.tgz
RUN tar -xzf ./dokuwiki-8a269cc015a64b40e4c918699f1e1142.tgz
RUN rm dokuwiki-8a269cc015a64b40e4c918699f1e1142.tgz
COPY --chown=www-data ./dokuwiki /var/www/html/
RUN rm /var/www/html/index.html
CMD apache2ctl -D FOREGROUND
