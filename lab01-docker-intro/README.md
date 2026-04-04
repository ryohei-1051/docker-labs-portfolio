# Lab 01 – Docker Intro

## Overview

This lab documents my first hands-on work with Docker container basics. The goal was to become comfortable with creating, starting, stopping, entering, detaching from, and removing containers while comparing multiple Linux-based images in a personal lab environment.

Rather than treating this as only a class submission, I rebuilt it as a repeatable reference lab that I can reuse later when validating Docker fundamentals.

## Objectives

- Deploy multiple Docker containers
- Show two different ways to create and enter containers
- Practice common lifecycle operations
- Document attach and detach behavior
- Check disk usage for each container

## Environment

- Host OS: `<your-host-os>`
- Docker version: `<docker-version>`
- Lab date: `<date>`
- Test images used:
  - Debian 10
  - Debian 11
  - Ubuntu 18
  - Mint 20
  - Alpine Linux

## Files in This Folder

- `docs/commands.md` – command reference used in the lab
- `docs/notes.md` – observations and lessons learned
- `docs/screenshots/` – evidence of lab execution
- `scripts/create-containers.sh` – optional helper script
- `scripts/cleanup.sh` – optional cleanup script

## What I Did

I deployed several Linux containers and verified that Docker could run different base images on the same host. I then demonstrated two container creation methods:

1. Create and enter at the same time
2. Create first, then start and enter afterward

I also documented the commands for:

- creating a container
- removing a container
- starting a container
- stopping a container
- connecting to a running container
- detaching without stopping it

Finally, I checked how much space each container used and noted the differences between images.

## Example Commands

```bash
docker pull debian:11
docker pull alpine:latest

docker run -it --name deb11-test debian:11 /bin/bash
docker create --name alpine-test alpine:latest
docker start alpine-test
docker exec -it alpine-test /bin/sh

docker ps
docker ps -a
docker stop deb11-test
docker rm deb11-test

docker container ls -s -a
