FROM debian:stretch-20210208-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y &&\
     apt-get dist-upgrade -y &&\
     apt-get install -y apache2

RUN a2enmod ssl && \
    a2dissite 000-default.conf && \
    a2ensite default-ssl

RUN apt-get autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]