#!/bin/sh
hosts=$(cat ./hosts)
for host in $hosts ; do
    ssh $host "bash -s" < ./doctl-cleanup.sh
done
