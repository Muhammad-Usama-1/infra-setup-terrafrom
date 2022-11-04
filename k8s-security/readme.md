kube-bench test k8s cluster to ensure that its meet CIS guidelines for security

https://github.com/aquasecurity/kube-bench/releases/download/v0.6.10/kube-bench_0.6.10_linux_amd64.deb
curl -L https://github.com/aquasecurity/kube-bench/releases/download/v0.6.10/kube-bench_0.6.10_linux_amd64.deb
-o kube-bench_0.6.10_linux_amd64.deb

sudo su

apt install ./kube-bench_0.6.10_linux_amd64.deb -f

kube-bench

it will do CIS analysis acording to machine they are executing differenet analysic for master and
worker node
Starting Fixing now 1 by one
ps -ef | grep etcd

point
kubelet run as configuration if you bootsraped using kubeadm

# How to deploy NGINX Ingress Controller on Kubernetes using Helm

## Prerequisites

1. A valid Kubernetes cluster. You can create one quickly from eks-setup-1 folder
1. A Kubectl installation with your Kubernetes cluster from the step above configured as the primary cluster.
1. The Helm CLI installed on your local machine.
   https://helm.sh/docs/intro/install/

## Step 1 - Install NGINX Ingress Controller using Helm

An ingress controller, because it is a core component of Kubernetes, requires specific configuration to be performed at the cluster level as part of installation. Lets look into what happens behind the scenes when you install NGINX ingress using helm. If you'd like to skip this, navigate to the bottom of this section to see the actual steps to install the NGINIX ingress controller.

The recommended configuration for NGINX uses three Kubernetes ConfigMaps:

Base Deployment
TCP configuration
UDP configuration
A Kubernetes service account is required to run NGINX as a service within the cluster. The service account needs to have following roles:

A cluster role to allow it to get, list, and read the configuration of all services and events. This role could be limited if you were to have multiple ingress controllers installed within the cluster. But in most cases, limiting access for this service account may not be needed.
A namespace-specific role to read and update all the ConfigMaps and other items that are specific to the NGINX Ingress controller’s own configuration.

To install an NGINX Ingress controller using Helm, add the nginx-stable repository to helm, then run helm repo update . After we have added the repository we can deploy using the chart nginx-stable/nginx-ingress.

helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update

helm install nginx-ingress nginx-stable/nginx-ingress --set rbac.create=true

Step 2 - Validate that NGINX is Running

kubectl get pods --all-namespaces -l app=nginx-ingress-nginx-ingress

kubectl get services nginx-ingress-nginx-ingress

Step 3 - Exposing Services using NGINX Ingress Controller

Now that an ingress controller is running in the cluster, you will need to create services that leverage it using either host, URI mapping, or even both.
