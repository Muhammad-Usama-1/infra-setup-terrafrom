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

# Now after setup secure cluster we need to configure k8s manifest correctly

Stop chasing misconfigurations, automate policy enforcement from code to cloud.

For this we will use

https://www.datree.io/

# Setup Ingress Controller

Please note that setting up ingress is different from environment to environment
I am using minikube for this demonstration
To enable the NGINX Ingress controller, run the following command:

minikube addons enable ingress

Verify that the NGINX Ingress controller is running

kubectl get pods -n ingress-nginx

kubectl create deployment web --image=gcr.io/google-samples/hello-app:1.0

kubectl expose deployment web --type=NodePort --port=8080
kubectl get service web
minikube service web --url

### Create example-ingress.yaml from the following file:

```yaml
apiVersion: networking.k8s.io/v1

kind: Ingress

metadata:
  name: example-ingress

  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /$1

spec:
  rules:
    - host: hello-world.info

      http:
        paths:
          - path: /

            pathType: Prefix

            backend:
              service:
                name: web

                port:
                  number: 8080
```

kubectl apply -f example-ingress.yaml

kubectl get ingress

```bash
NAME              CLASS   HOSTS        ADDRESS          PORTS     AGE
example-ingress   nginx   usama.info   192.168.59.102   80, 443   44m
```

Add the following line to the bottom of the /etc/hosts file on your computer (you will need administrator access):
ip-aadress-from-above-command usama.info
k expose po caddy --name caddy-svc --port 80

kubectl port-forward service/caddy-svc 7080:80

In hosts file
minikube ip learnwithusama.com

openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout tls.key -out tls.cert -subj '/CN=learnwithusama.com' -days 365

### Now TLS in that domain usama.info

openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout tls.key -out tls.cert -subj '/CN=usama.info' -days 365

k create secret tls sec-usama.info --cert=tls.cert --key=tls.key
make some change in example-ingress.yaml file under spec block

```yaml
tls:
  - hosts:
      - usama.info
    secretName: sec-usama.info
```

Now you have apply change
k apply -f example-ingress.nginx

## k8s security Network Policies

Authentication -> Autherization -> Admission control -> stored in etcd

1. When we create a network policy we must have to provide a label for selection of pod where the
   policy will apply
   1f policy is like list then its and OR(condition), otherwise AND(condition)
   example of OR condition

```yaml
- ipBlock:
    cidr: 172.17.0.0/16
    except:
      - 172.17.1.0/24
- namespaceSelector:
    matchLabels:
      project: myproject
- podSelector:
    matchLabels:
      role: frontend
```

### Best Practise

Deny All traffice between the pods, by default k8s allow communication between all pods

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny-ingress
  namespace: default
spec:
  podSelector: {}
  # Which mean  all pods (match all pods) bcz we have not defined any thing here
  policyTypes:
    - Ingress
```

Refers to k8s documentation for making network policy of your Application Requirements
Tips
Protect node metadata and endpoints
control control-plane and worker node ports using network policy

# Minimize use of Access GUI

For access k8s dashboard we have two ways using kubeconfig(file) or Token(Bearer token)
k config view
k config current-context

we will not give acces to everyone
we will to Authorization using RBAC

how it will works , we will create a user , and role with get,list and create rbac with both
service account -> Cluster role --> Restrict to view,get ,list etc

--- cl us t er role bi nid ing----
