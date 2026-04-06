FROM debian:11

LABEL maintainer="rnakao@my.bcit.ca"
LABEL description="Custom Debian 11 Apache PHP image"

RUN apt-get update && \
    apt-get install -y --no-install-recommends apache2 php libapache2-mod-php && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY src/index.php /var/www/html/index.php
COPY assets/docker.jpg /var/www/html/docker.jpg

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
