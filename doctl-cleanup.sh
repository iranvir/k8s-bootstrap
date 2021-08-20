#!/bin/sh
apt-get purge cloud-init --yes
apt-get autoremove --purge --yes
rm -rf /var/lib/cloud /etc/cloud /usr/lib/python3/dist-packages/cloudinit/sources/helpers
apt-get update -y
apt-get install ifupdown -y
sed -i '/post-up ifup eth0:1/,$d' /etc/network/interfaces
reboot
exit 0
