# Infrastructure setup using terraform

### VPC , EKS etc

# EKS setup Using Terraform in custom VPC

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
