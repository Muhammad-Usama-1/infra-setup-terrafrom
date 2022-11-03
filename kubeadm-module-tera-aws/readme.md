# Kubernetes clusters on AWS with kubeadm Terraform

They have no CNI plugin installed which causes the nodes to be NotReady and prevents any Pods from being scheduled

## Prerequisites for using the Terraform module

1. Install Terraform

1. Configure AWS credentials

1. Ensure default OpenSSH keys

The Terraform kubeadm module will set up SSH access to the nodes of the cluster
by using the default key pair of OpenSSH

- ~/.ssh/id_rsa (private key)
- ~/.ssh/id_rsa.pub (public key)

If you currently don’t have these files on your local machine,
you can generate them with the following command

```bash
ssh-keygen
```

create a file named main.tf with the following content

```bash
 provider "aws" {
  region = "us-east-1"
}

module "network" {
  source  = "weibeld/kubeadm/aws//modules/network"
  version = "~> 0.2"
}
module "cluster" {
  source    = "weibeld/kubeadm/aws"
  version   = "~> 0.2"
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.subnet_id
}
output "nodes" {
  value = module.cluster.cluster_nodes
}
```

```bash
kubectl --kubeconfig your-new.conf get pods --all-namespaces
```

Nodes of the cluster should be NotReady

The reason that your cluster has no CNI plugin installed is that kubeadm doesn’t install a CNI plugin by default — rather it leaves this choice to the user.

## Installing CNI plugins

```bash
 kubectl apply \
  -f https://docs.projectcalico.org/manifests/calico.yaml \
  --kubeconfig growing-cattle.conf

```

OR

```bash
kubectl apply \
  -f https://raw.githubusercontent.com/cilium/cilium/1.7.0/\
install/kubernetes/quick-install.yaml \
  --kubeconfig real-hedgehog.conf
```

```bash
# Identify Kubernetes version
$ K8S_VERSION=$(kubectl version --kubeconfig obliging-eft.conf | base64 | tr -d '\n')
# Install CNI plugin
$ kubectl apply \
  -f "https://cloud.weave.works/k8s/net?k8s-version=$K8S_VERSION" \
  --kubeconfig obliging-eft.conf
```
