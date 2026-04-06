FROM httpd:2.4

LABEL maintainer="your-email@example.com"
LABEL description="Custom Apache image for Docker Swarm lab"

COPY src/index.html /usr/local/apache2/htdocs/index.html
COPY assets/your-image.jpg /usr/local/apache2/htdocs/your-image.jpg

EXPOSE 80
