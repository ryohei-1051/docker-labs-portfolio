# Lab 02 – Docker Swarm and Custom httpd Service

## Overview

This lab documents my hands-on introduction to Docker Swarm clustering and basic service deployment. I built a 3-node Swarm cluster, customized an `httpd` image, distributed that image across nodes, and exposed the service through a published port.

I rebuilt the lab in a more portfolio-friendly format so that it demonstrates not only completion of the task, but also repeatable clustering workflow and service validation.

## Objectives

- Build a 3-node Docker Swarm cluster
- Customize an existing `httpd` image
- Modify `index.html` with personal content
- Include a custom image asset
- Publish the service on port `80xx`
- Access the service from a Swarm node IP

## Environment

- Node 1: Swarm manager
- Node 2: worker
- Node 3: worker
- Docker version: `<docker-version>`
- Published port: `80<last-two-digits>`
- OS used for nodes: `<your-os>`

## Files in This Folder

- `Dockerfile`
- `src/index.html`
- `assets/your-image.jpg`
- `docs/topology.md`
- `docs/image-distribution.md`
- `docs/verification.md`
- `docs/screenshots/`
- `scripts/swarm-init.sh`
- `scripts/join-worker.sh`
- `scripts/deploy-service.sh`

## Architecture

- 1 manager node handles Swarm control plane tasks
- 2 worker nodes participate in service scheduling
- Custom Apache image is built and copied to all nodes
- Service is deployed with replicas across the cluster

## What I Did

First, I initialized Docker Swarm on the manager node and joined two worker nodes using the join token. After cluster formation, I customized an Apache `httpd` container by modifying the default `index.html` and adding a custom image file.

I then converted the modified container into a reusable image, exported it, copied it to the other nodes, and loaded it there so the service could be scheduled anywhere in the cluster. Finally, I deployed the service with replicas and published it on the required port.

## Example Commands

```bash
docker swarm init --advertise-addr <manager-ip>

docker swarm join --token <token> <manager-ip>:2377

docker build -t <yourname>-httpd:latest .

docker save <yourname>-httpd:latest -o <yourname>-httpd.tar
scp <yourname>-httpd.tar user@worker1:/tmp/
scp <yourname>-httpd.tar user@worker2:/tmp/

docker load -i /tmp/<yourname>-httpd.tar

docker service create \
  --name <yourname>-web \
  --replicas 3 \
  --publish 80<last-two-digits>:80 \
  <yourname>-httpd:latest

docker service ps <yourname>-web
```

## Verification

I considered the lab complete when I could verify all of the following:

Swarm join line was generated successfully
custom image appeared in docker images
service replicas were distributed across nodes
published port was configured correctly
webpage was reachable from a Swarm IP

## What I Learned

This lab introduced the difference between running a single local container and running a service across a cluster. It also forced me to think about image portability, because local images do not automatically exist on other Swarm nodes unless they are distributed properly.

## Problems and Fixes
Problem

Image existed only on the manager

Fix

I used `docker save`, `scp`, and `docker load` to distribute the image to each worker.

Problem

Port publishing confusion

Fix

I verified the published port syntax carefully before creating the service.

## Improvements for Personal Lab
Replace manual image distribution with a private registry
Add a failure test by shutting down one worker node
Add rolling update validation
Add overlay network documentation
Add a small diagram showing manager and worker roles
