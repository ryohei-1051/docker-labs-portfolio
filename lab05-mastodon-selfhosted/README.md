
# Lab 05 – Self-Hosted Mastodon with Docker

## Overview

This bonus lab documents my deployment of a self-hosted Mastodon instance using Docker. The goal was to move beyond small single-container examples and work with a more realistic service stack that behaves like an actual platform deployment.

I treated this lab as an introduction to self-hosted application operations, including service access, name resolution, and basic validation through a successful post.

## Objectives

- Deploy a Mastodon server using Docker
- Access the Mastodon instance successfully
- Create and verify a post
- Document setup considerations for non-public lab environments
- Reflect on the potential value of self-hosted social platforms

## Environment

- Host OS: `<your-host-os>`
- Deployment method: Docker / Docker Compose
- Hostname used: `mastodon.yourfakedomain.com`
- Access model:
  - local lab only, or
  - internet-accessible VM

## Files in This Folder

- `docker-compose.yml`
- `.env.example`
- `docs/architecture.md`
- `docs/hosts-file-note.md`
- `docs/verification.md`
- `docs/screenshots/`
- `scripts/up.sh`
- `scripts/down.sh`

## What I Did

I deployed a Mastodon environment using Docker and verified that the service stack could run successfully in a lab setting. After deployment, I accessed the instance, completed the required validation steps, and made a test post.

Because this type of application often expects a valid hostname, I also documented the local name-resolution workaround used in non-public environments.

## Local Name Resolution Note

If the Mastodon instance is not hosted publicly, local name resolution may be required.

Example:

```bash
sudo nano /etc/hosts
```
Add an entry similar to:
```bash
<server-ip> mastodon.yourfakedomain.com
```

## Example Commands
```bash
docker compose up -d
docker compose ps
docker compose logs -f
docker compose down
```

## Verification

I considered the lab successful when I could verify:

Docker services started successfully
the Mastodon site loaded in the browser
account access worked as expected
a post could be created successfully
screenshots captured the key steps and final result

## What I Learned

This lab was more realistic than the previous ones because it introduced a platform-style deployment instead of a simple test container. It also showed that self-hosting involves more than just starting containers; it includes naming, access, persistence, and service coordination.

From a portfolio perspective, this is useful because it demonstrates interest in real-world service deployment rather than only isolated command practice.

## Problems and Fixes
Problem

Hostname resolution in a non-public environment

Fix

I added a local `/etc/hosts` entry on the host system so the Mastodon service name resolved correctly.

Problem

More moving parts than earlier labs

Fix

I documented the setup and verification steps carefully so the deployment would be easier to recreate later.

## Improvements for Personal Lab
- Add reverse proxy and TLS documentation
- Document persistent storage paths and backups
- Add update and rollback procedure
- Add health monitoring notes
- Add resource sizing guidance
- Add a network diagram of Mastodon-related services
