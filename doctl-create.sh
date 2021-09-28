#!/bin/sh
hosts=$(cat ./hosts)
for host in $hosts ; do
    doctl compute droplet create $host --image debian-11-x64 --ssh-keys c8:df:91:3a:17:dc:63:d3:77:ad:01:4e:45:07:3f:b0 --region lon1 --size s-1vcpu-1gb --no-header --tag-name k8s-bootstrap 
done
sleep 30
doctl compute d ls --tag-name k8s-bootstrap --no-header --format=PublicIPv4,Name,Tags | awk '{ print $1"\t"$2"\t# "$3 }' >> /etc/hosts
exit 0
