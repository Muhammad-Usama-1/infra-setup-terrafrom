## Guilde to DevOps

This guides contains

# TODO

AT LEAST ONE EMAIL CONFIGURATION WITH BLOG

# INCOMPLETE

DNS CONFIGURATION
Examples of Microservices Best practise

1. ### Linux (LVM, filesystem, processes, disk management , users , SSH best practices , shedule jobs and tasks etc )

   1. Network management (Assigning static IPs)
   1. All types of RAID (comming soon)
   1. Users management, sudo group , setting up root password in ubuntu 22.04

1. ### Microservices Security (docker best practises etc and other CIS guildeline , tools)

1. ### Modular way for creating VPC with Terraform

1. ### Terraform for setting up EKS clustter in AWS or using with kubeadm

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

---

---

---

```bash
├── ansible
│ └── readme.md
├── aws
│ ├── aws-services-basic-defination.md
│ ├── client-vpn.md
│ ├── dynamo-trigger-lamda-sns.md
│ └── send-ses-email.md
├── cli-eks
│ ├── cluster.yaml
│ └── readme.md
├── cloud-computing-term
│ └── readme.md
├── DNS
│ └── readme.md
├── docker
│ └── intro.md
├── dumb.txt
├── eks-setup-1
│ ├── eks-cluster.tf
│ ├── main.tf
│ ├── outputs.tf
│ ├── readme.md
│ ├── security-groups.tf
│ ├── variable.tf
│ ├── versions.tf
│ └── vpc.tf
├── k8s-security
│ ├── example-ingress.yaml
│ ├── image1.png
│ ├── readme.md
│ ├── reports.txt
│ └── tools.md
├── kubeadm-module-tera-aws
│ ├── main.tf
│ └── readme.md
├── linux-beyond
│ ├── Control Operators.md
│ ├── Disk Management in Linux.md
│ ├── email-config.md
│ ├── File Permissions(Standard, Special & ACL).md
│ ├── file-security.md
│ ├── Filesystems & Mounting in Linux.md
│ ├── ipadd.png
│ ├── ip.png
│ ├── LAMP_Stack.md
│ ├── linux.gif
│ ├── localuser-mangement.md
│ ├── lvm
│ │ ├── Logical Volume (LVM) Snapshot Feature.md
│ │ ├── LVM.md
│ │ ├── Migrate Logical Volume Disk To Another Server.md
│ │ ├── Migrate Physical Volumes.md
│ │ ├── Restore Removed LVM With Data in Linux.md
│ │ └── Split Volume Groups in Linux.md
│ ├── Managing-Profile-Files.md
│ ├── network-management.md
│ ├── Process Management in Linux.md
│ ├── pub-controlop.md
│ ├── raid.md
│ ├── readme.md
│ ├── Schedule Future Jobs-Tasks.md
│ ├── ssh.md
│ └── System Logging & Logs Management .md
├── modular-way-vpc
│ ├── main.tf
│ ├── variable.tf
│ └── vpc.tf
├── Prometheus
│ └── readme.md
├── provider.tf
├── random-tips-tricks
│ └── readme.md
├── readme.md
├── send_email.js
├── terraform
│ ├── images
│ │ └── terraform.webp
│ └── readme.md
├── terraform.tfstate
├── variable.tf
└── vpc.tf
```

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
