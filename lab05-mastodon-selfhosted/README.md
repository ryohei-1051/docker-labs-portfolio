
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
