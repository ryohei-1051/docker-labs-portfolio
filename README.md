# Docker Labs Portfolio

A personal Docker lab portfolio built from five hands-on labs covering container basics, clustering, multi-container applications, custom image creation, and self-hosted services.

## Overview

This repository documents my Docker learning progression through a series of practical labs:

- **Lab 01 – Docker Intro**  
  Worked with core container operations such as creating, starting, stopping, attaching to, detaching from, and removing containers. Also compared container disk usage and recorded the command patterns used for each workflow.

- **Lab 02 – Docker Swarm + Custom httpd**  
  Built a 3-node Docker Swarm cluster, customized an `httpd` image by editing `index.html`, distributed the custom image across nodes, and published the service for access through the Swarm.

- **Lab 03 – Docker Compose + WordPress/MySQL**  
  Modified a sample Docker Compose deployment for WordPress and MySQL, updated variable names, adjusted exposed ports, and applied CPU and memory limits to both services.

- **Lab 04 – Custom LAPP App Image**  
  Built a custom Debian 11 image using a `Dockerfile`, installed Apache and PHP, added a custom `index.php`, included a custom image asset, and deployed the result as a working web application.

- **Lab 05 – Self-Hosted Mastodon**  
  Deployed a Mastodon server using Docker, validated access, and documented the setup considerations for local name resolution when a public domain is not available.

## Repository Structure

- `lab01-docker-intro/`  
  Docker basics, lifecycle commands, notes, and screenshots

- `lab02-docker-swarm-httpd/`  
  Swarm clustering, custom Apache image, service deployment, and verification

- `lab03-docker-compose-wordpress/`  
  Multi-container WordPress stack using Docker Compose

- `lab04-custom-lapp-app/`  
  Custom Debian/Apache/PHP image with application content

- `lab05-mastodon-selfhosted/`  
  Self-hosted social platform lab using Docker

- `docs/`  
  Shared notes, diagrams, and quick references

## Goals of This Repository

This repository is not only a course archive. It is intended to show:

- hands-on Docker administration
- container lifecycle knowledge
- custom image creation
- multi-container application deployment
- service publishing and verification
- documentation and repeatable lab execution

## Environment

These labs were built in personal lab environments using Linux-based virtual machines and Docker. Some labs required multiple VMs and service verification through browser access and command-line output.

## How to Use This Repository

Each lab directory contains its own `README.md` with:

1. objective
2. environment and prerequisites
3. files used in the lab
4. build/deploy steps
5. verification steps
6. screenshots or evidence
7. lessons learned
8. possible improvements

## Suggested Expansion Path

To strengthen these labs beyond the original course requirements, I plan to expand them in the following ways:

- add reusable shell scripts for build and cleanup
- improve documentation with topology and workflow diagrams
- add `.env.example` files where applicable
- document verification and troubleshooting steps
- add image optimization and security notes
- add persistence, backup, and update procedures for stateful services

## Key Skills Demonstrated

- Docker container lifecycle management
- Docker image customization
- Docker Swarm fundamentals
- Docker Compose deployment
- Web application containerization
- Linux-based service deployment
- Technical documentation and verification

## Notes

The original course PDFs are included in `course-materials/` for reference.  
This repository focuses on rebuilding the labs in a cleaner, more reproducible portfolio format.

## Future Improvements

- add health checks and restart policies
- add reverse proxy examples
- add persistent volumes and backup notes
- add CI workflow for image build validation
- add security hardening notes for containerized services
- 
