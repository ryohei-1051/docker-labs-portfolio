FROM httpd:2.4

LABEL maintainer="rnakao@my.bcit.ca"
LABEL description="Custom Apache image for Docker Swarm lab"

COPY src/index.html /usr/local/apache2/htdocs/index.html
COPY assets/docker.jpg /usr/local/apache2/htdocs/docker.jpg

EXPOSE 80
