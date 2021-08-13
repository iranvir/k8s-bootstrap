#!/bin/sh
for host in $@ ; do
    doctl compute droplet create $host --image ubuntu-20-04-x64 --ssh-keys c8:df:91:3a:17:dc:63:d3:77:ad:01:4e:45:07:3f:b0 --region lon1 --size s-2vcpu-2gb-amd --no-header
done
sleep 10
doctl compute d ls --no-header | awk '{ print $3"\t"$2" #k8s-bootstrap"}' >> /etc/hosts
exit 0
