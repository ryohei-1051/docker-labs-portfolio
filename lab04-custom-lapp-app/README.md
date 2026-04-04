# Lab 14 – Custom LAPP App Image

## Overview

This lab documents the creation of a custom Docker image built from Debian 11 with Apache and PHP. The image serves a custom `index.php` page that includes my name, student number, an image asset, and system information from inside the container.

I rewrote the lab as a reusable app-packaging project rather than only a one-time class submission.

## Objectives

- Build a custom Debian 11 image from scratch
- Install Apache and PHP
- Create a working LAPP-style container image
- Add a custom `index.php`
- Include a custom image asset
- Set the hostname in the image
- Deploy and verify the custom image

## Environment

- Base image: Debian 11
- Web server: Apache
- Language runtime: PHP
- Docker version: `<docker-version>`
- Container hostname target: `<yourname>-<studentnumber>`

## Files in This Folder

- `Dockerfile`
- `src/index.php`
- `assets/yourpic.jpg`
- `docs/build-notes.md`
- `docs/verification.md`
- `docs/screenshots/`
- `scripts/build.sh`
- `scripts/run.sh`

## What I Did

I created a custom Docker image using Debian 11 as the base. Inside the image, I installed Apache and PHP, then copied a custom `index.php` file and image asset into the correct web root location.

The PHP page displays my name, student number, image, and system output from `php_uname()`. I also configured the hostname requirement and ran the container to verify that the page loaded correctly through Apache.

## Example Dockerfile Pattern

```dockerfile
FROM debian:11

LABEL maintainer="<your-email>"

RUN apt-get update && \
    apt-get install -y apache2 php libapache2-mod-php && \
    apt-get clean

COPY src/index.php /var/www/html/index.php
COPY assets/yourpic.jpg /var/www/html/yourpic.jpg

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
