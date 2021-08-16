#!/bin/sh
doctl compute droplet list --tag-name k8s-bootstrap --no-header | awk '{print $1}' | xargs -I vm doctl compute droplet delete vm --force
sed -i '/# k8s-bootstrap/d' /etc/hosts
rm $HOME/.ssh/known_hosts
