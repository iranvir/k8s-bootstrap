#!/bin/sh
for host in $@ ; do
    doctl compute droplet create $host --image ubuntu-20-04-x64 --ssh-keys c8:df:91:3a:17:dc:63:d3:77:ad:01:4e:45:07:3f:b0 --region lon1 --size s-1vcpu-1gb --no-header
done
