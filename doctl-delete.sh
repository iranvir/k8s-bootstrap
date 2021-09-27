#!/bin/sh
## You can delete a VM just by its IPv4 address...Optimization for correctness in a later point in time. Use IPv4 as the identifier on DO and /etc/hosts ends
doctl compute droplet list --tag-name k8s-bootstrap --no-header --format=ID | xargs -I vm doctl compute droplet delete vm --force
gsed -i '/# k8s-bootstrap/d' /etc/hosts
rm $HOME/.ssh/known_hosts
