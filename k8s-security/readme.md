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
