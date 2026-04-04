# Lab 13 – Docker Compose WordPress Stack

## Overview

This lab documents a multi-container application deployment using Docker Compose. The environment used WordPress and MySQL, with configuration changes to variables, published port settings, and resource limits.

I expanded the original lab into a cleaner infrastructure-focused project that highlights Compose workflow, service relationships, and configuration management.

## Objectives

- Modify a sample WordPress Docker Compose deployment
- Change the exposed port to `55xx`
- Rename variables to include my own naming convention
- Document what had to be corrected to make the stack work
- Apply RAM and CPU limits to both WordPress and MySQL
- Verify access to the WordPress site

## Environment

- Docker Compose version: `<compose-version>`
- Host OS: `<your-host-os>`
- Published port: `55<last-two-digits>`
- Application stack:
  - WordPress
  - MySQL

## Files in This Folder

- `docker-compose.yml`
- `.env.example`
- `docs/what-i-changed.md`
- `docs/resource-limits.md`
- `docs/verification.md`
- `docs/screenshots/`
- `scripts/up.sh`
- `scripts/down.sh`

## What I Did

I started with a sample WordPress Compose deployment and modified it to meet the lab requirements. This included changing the published port, renaming environment variables, and correcting configuration issues so the stack could start successfully.

I also added resource limits for both the WordPress and MySQL containers, then launched the full stack and verified browser access to the site.

## Example Commands

```bash
docker compose up -d
docker compose ps
docker compose logs -f
docker compose down
