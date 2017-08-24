# Setting up Container Web app
FROM phusion/baseimage
MAINTAINER calshankar@icloud.com

CMD ["/sbin/my_init", "/bin/bash"]

RUN apt-get update && apt-get install -y \
    iputils-ping \
    apache2 \
    traceroute \
    bash \
    && apt-get clean \
    && rm -rf /var/lib/apt/list/* /tmp/* /var/tmp/* 

EXPOSE 80

COPY index.html /var/www/html/

COPY httpd.conf /etc/httpd/conf/

ENTRYPOINT ["apache2ctl"]

CMD ["-D", "FOREGROUND"]
