# Setting up Container Web app
FROM phusion/baseimage
MAINTAINER calshankar@icloud.com
LABEL application=webApp

RUN apt-get update && apt-get install -y \
    apache2 \
    traceroute \
    bash \
    && apt-get clean \
    && rm -rf /var/lib/apt/list/* /tmp/* /var/tmp/* 

ENV keyValue=google.com

EXPOSE 80

HEALTHCHECK --interval=3s --timeout=30s CMD curl --fail -m 2 http://localhost:80/ || exit 1

COPY index.html /var/www/html/

COPY httpd.conf /etc/httpd/conf/

ENTRYPOINT ["apache2ctl"]

CMD ["-D", "FOREGROUND"]