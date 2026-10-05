#!/bin/bash
# Runs once as root on first boot (EC2 user data).
# Output is logged to /var/log/cloud-init-output.log on the instance.
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive

# Install Docker Engine from Docker's official apt repository
apt-get update
apt-get install -y ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
  > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl enable --now docker

# Post-install steps
apt-get update
usermod -aG docker ubuntu
# `newgrp docker` is interactive and has no effect here; the ubuntu user
# gets the docker group automatically on its first SSH login.
