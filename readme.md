## Guilde to DevOps

This guides contains

# TODO

AT LEAST ONE EMAIL CONFIGURATION WITH BLOG

# INCOMPLETE

DNS CONFIGURATION

1. ### Linux (LVM, filesystem, processes, disk management , users etc )

1. ### Microservices Security (docker best practises etc and other CIS guildeline , tools)

1. ### Terraform files for EKS ,kubeadm

1. ### AWS Tools use case with projects
   1. AWS client VPN
   1. More comming soon

---

# VPC set up

this main folder have three files which will create a vpc named provider.tf ,vpc.tf, variable.tf

```bash
terraform init
terraform apply
```

---

### EKS setup Using Terraform in custom VPC

We will see some of the different ways of Creating kubernetes environment (managed , self managed) in AWS in isolated envirnment

Firstly we will see how we can create a VPC without using terrafrom module so we can working of VPC in AWS

Then we will see how we can utilize terrafrom module to create VPC

A brief description of how to setup comeplete EKS environment for Application
Deployments ets in AWS with VPC

## Tools Required

**Client:** Terrafrom, kubectl (for verification), AWS
For Installing these tools

[Terrafrom](https://www.terraform.io/downloads/)

[Install and setup Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

[AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

## Commands after EKS setup

Run the following command to retrieve the access credentials for your cluster and configure kubectl

aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)

You can now use kubectl to manage your cluster and deploy Kubernetes configurations to it.

## Verify that kubectl is working properly

kubectl cluster-info
kubectl get nodes

When you create a new cluster, Amazon EKS creates an endpoint for the managed Kubernetes API server that you use to communicate with your cluster (using Kubernetes management tools such as kubectl). By default, this API server endpoint is public to the internet, and access to the API server is secured using a combination of AWS Identity and Access Management (IAM) and native Kubernetes Role Based Access Control (RBAC).
