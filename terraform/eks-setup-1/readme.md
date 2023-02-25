## Commands after EKS setup

Run the following command to retrieve the access credentials for your cluster and configure kubectl

aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
which will change into
aws eks --region us-east-1 update-kubeconfig --name education-eks-PvXPZA66

You can now use kubectl to manage your cluster and deploy Kubernetes configurations to it.

## Verify that kubectl is working properly

kubectl cluster-info
kubectl get nodes
