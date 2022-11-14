# EKS cluster setup in AWS using CLI

## Prerequisites

1. [eksctl CLI](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html)

```bash
eksctl create cluster -f ./cluster.yaml
```

eksctl created a kubectl config file in ~/.kube or added the new cluster's configuration within an existing config file in ~/.kube on your computer.

# Delete your cluster and nodes

```bash
eksctl delete cluster --name my-cluster --region region-code
```
