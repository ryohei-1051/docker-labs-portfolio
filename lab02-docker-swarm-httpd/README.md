
Lab 12 is stronger as a portfolio piece because it adds a 3-node Swarm cluster, a customized `httpd` image, and published service access across the cluster. The lab also explicitly expects image distribution across nodes. 

```markdown
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
