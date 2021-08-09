#!/bin/sh
echo "Doctl hosts added below" >> /etc/hosts
doctl compute d ls --no-header | awk '{ print $3"\t"$2}' >> /etc/hosts
exit 0
