# Bootstrapping Kubernetes using Ansible and a couple of shell scripts

## Creating the Control and Worker Nodes
The two scripts `doctl-create.sh` and `doctl-delete.sh` are used to spin up
DigitalOcean VMs or "Droplets" based on Debian 10. The list of hosts to be
created/deleted by these shell scripts are in the file `hosts`. Ansible also uses this list as its inventory file, as mentioned in `ansible.cfg`

The create/delete scripts also adds/removes the VMs' IP addresses and hostname
to/from your `/etc/hosts` so you can SSH into VMs using just the name mentioned in the `hosts` file, e.g, `ssh root@control-00` without fishing for Public IP addresses.

The `kubeadm-install.yaml` does all the configuration necessary for Kubernetes
to work. Including installing Kubernetes' packages, configuring boot parameters,
and kernel modules. The documentation to manually perform this can be found [here](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/). I use `containerd` as the container runtime.

The `cleanup.yaml` playbook deletes the private IPs on `eth0` and `eth1` just
because I wanted to simplify the underlying networking.

## Starting Kubernetes
After both the playbooks have run across all your nodes and **all the nodes have
been rebooted**. Select one to work as your Control and run `kubeadm init`
inside it and follow the instructions printed in there to join other nodes to
the control plane. You can also copy `/etc/kubernetes/admin.conf` file to your
local machine at `~/.kube/config` and use it to run `kubectl` from your end
without having to SSH into the control node.

After this you will need to [install a Pod Networking
solution](https://kubernetes.io/docs/concepts/cluster-administration/networking/).

P.S: Since I use Flannel for Pod Networking I run `kubeadm init
--pod-network-cidr 10.244.0.0/16` because Kubeadm's default cidr doesn't work
with Flannel.

Once everything is done, run `kubectl get nodes` and `kubectl get pods --all-namespaces` to see if you cluster is healthy and up and running.
