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
```

## Example Commands
```
docker build -t <yourname>-lapp:latest .
docker run -d --name <yourname>-lapp -p 8080:80 --hostname <yourname>-<studentnumber> <yourname>-lapp:latest
docker ps
curl http://localhost:8080
```

## Verification

I considered the lab successful when I confirmed:

- image built successfully from the Dockerfile
- Apache and PHP were working
- custom index.php rendered correctly
- image asset displayed correctly
- container hostname matched the requirement
- page was accessible over HTTP

## What I Learned

This lab was important because it moved beyond simply running existing images. Instead, I had to package an application into a custom image and think about build instructions, file placement, dependencies, and runtime behavior.

It also reinforced the difference between container build-time configuration and run-time validation.

## Problems and Fixes
Problem

Apache alone was not enough for PHP execution

Fix

I added PHP support packages and validated the container served PHP through Apache.

Problem

Static assets and PHP file had to be copied into the correct path

Fix

I used `COPY` instructions in the Dockerfile and verified the web root contents after container startup.

## Improvements for Personal Lab
- Add `.dockerignore`
- Reduce image size by cleaning package cache
- Add a health check
- Add non-root hardening notes where practical
- Build the image automatically with GitHub Actions
- Publish the image to GHCR or Docker Hub
