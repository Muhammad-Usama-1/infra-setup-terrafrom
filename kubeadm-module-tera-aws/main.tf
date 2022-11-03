provider "aws" {
  # You can change the region as per your requirement
  region = "us-east-1"
}

module "network" {
  source  = "weibeld/kubeadm/aws//modules/network"
  version = "~> 0.2"
}
module "cluster" {
  source    = "weibeld/kubeadm/aws"
  version   = "~> 0.2"
  # By default, the kubeadm module creates the cluster in the default VPC 
  # to create a dedicated VPC for your cluster on-the-fly.
  # To do so, edit your Terraform configuration as follows (below line)
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.subnet_id
}
output "nodes" {
  # For SSH in to any node copy Public IP from AWS and use default private ssh key
  # Note that ~/.ssh/id_rsa is the default OpenSSH private key that is used by default 
  # by the Terraform kubeadm module to set up SSH access to the cluster nodes. 
  # It's the credential that allows you to connect to all the nodes of the cluster.
  value = module.cluster.cluster_nodes
}

