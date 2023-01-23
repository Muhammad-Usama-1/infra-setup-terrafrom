# Basics of AWS service

# TODOs

load balancer , storage types

# Proxies

A proxy is a server or a piece of software that acts as an intermediary between a client and another server or service. It is used to forward requests and responses between the client and the server, and can be used for a variety of purposes, such as security, load balancing, or anonymity.

Here are a few examples of how proxies are used in the real world:

Web proxy: A web proxy is a server that sits between a client and the internet. It intercepts requests made by the client to access web pages and forwards them to the appropriate web server. The web server responds with the requested page, which the proxy then sends back to the client. This can be used to cache frequently requested pages, block unwanted content, or hide the client's IP address for anonymity.

Reverse proxy: A reverse proxy is a server that sits in front of a group of servers and directs client requests to the appropriate server. It is often used to balance the load between multiple servers and to improve security by hiding the internal IP addresses of the servers.

VPN proxy: A VPN (virtual private network) proxy is a server that acts as a gateway to a VPN. When a client connects to the VPN proxy, it establishes a secure, encrypted connection to the VPN server, allowing the client to access resources on the private network as if it were connected directly.

SOCKS proxy: A SOCKS proxy is a general-purpose proxy that can be used to forward any type of network traffic. It is often used to bypass firewalls and access blocked content, or to provide a secure way to access a private network from a remote location.

Anonymizing proxy: An anonymizing proxy is a type of proxy that is used to hide the client's IP address from the server. This can be used to protect the client's privacy or to access content that is blocked based on the client's location.

```nginx
server {
    listen 80;
    server_name yourdomain.com;
    location / {
        proxy_pass http://your_upstream_server;
    }
}
```

Squid is a widely-used open-source web proxy server. It is typically used to improve the performance of web traffic by caching frequently requested pages, but it can also be used to provide security, anonymity, or to block unwanted content. Squid is known for its flexibility and high performance, and it can be used in a variety of different configurations and setups.

Squid is a proxy server that can be installed on a variety of operating systems, including Linux, Unix, and Windows. It can be configured to work as a forward proxy, a reverse proxy, or a transparent proxy. Squid supports a wide range of protocols, including HTTP, HTTPS, FTP, and gopher. It also supports caching of different types of content, such as text, images, and video.

Squid can also be used to provide access controls and security features, such as authentication and encryption. Additionally, it can be used to filter and block unwanted content based on different criteria, such as IP address, domain name, or URL.

Overall, Squid is a popular and widely used proxy server that provides a lot of flexibility and performance, it can be used for a variety of purposes, such as caching, security, and content filtering.

# AWS Client VPN

AWS Client VPN is a managed client-based VPN service provided by Amazon Web Services (AWS). It enables secure and seamless access to resources in your AWS virtual private cloud (VPC) over the internet. With Client VPN, you can connect to your VPC using OpenVPN or IKEv2 protocols on your laptop, desktop, or mobile device. It supports both Active Directory and RADIUS based authentication, and also supports split-tunneling, which allows you to access resources in your VPC while also having internet access on your device.

<b> For configuring aws client VPN <a href ="client-vpn.md" > follow</a> </b>

# Site to site VPN

Site-to-Site VPN is a VPN solution that allows you to securely connect your on-premises network to an AWS Virtual Private Cloud (VPC) over the internet. This enables you to extend your on-premises network into the cloud, allowing your on-premises resources to access resources in the VPC and vice versa.

AWS Site-to-Site VPN uses the Internet Protocol Security (IPsec) protocol to establish a secure connection between the on-premises network and the VPC. This connection is established using a VPN gateway in the on-premises network and a Virtual Private Gateway (VGW) in the VPC.

<b> In summary, AWS Client VPN is a fully managed VPN service for remote clients to securely access resources in an AWS VPC, while Site-to-Site VPN is a VPN solution that enables you to securely connect your on-premises network to an AWS VPC. They are different in terms of purpose, scale, connection, authentication and routing.</b>

# CIDR (Classless Inter-Domain Routing

CIDR (Classless Inter-Domain Routing) is a method of allocating IP addresses and routing IP traffic. It is used in client VPN to specify the range of IP addresses that are available for assignment to clients that connect to the VPN. CIDR notation is used to specify a range of IP addresses in the form of a base IP address and a prefix length. For example, 10.0.0.0/16 specifies a range of IP addresses from 10.0.0.0 to 10.0.255.255.

When you configure a client VPN, you'll need to specify the CIDR block that will be assigned to clients. This CIDR block will be used to assign IP addresses to clients that connect to the VPN. This makes sure that each client is assigned a unique IP address and that the IP addresses used by clients do not overlap with IP addresses used by other resources in your VPC.

<b>
It's important to note that the CIDR block specified should not overlap with any existing VPC or on-premises network, otherwise it may cause IP address conflicts.</b>

# Amazon Web Services (AWS) Certificate Manager (ACM)

Amazon Web Services (AWS) Certificate Manager (ACM) is a service that makes it easy to provision, manage, and deploy Secure Sockets Layer/Transport Layer Security (SSL/TLS) certificates for use with AWS services.

With ACM, you can easily request and deploy SSL/TLS certificates for use with Elastic Load Balancing, Amazon CloudFront distributions, and APIs for Amazon API Gateway. You can also use ACM to issue certificates for your internal resources such as load balancers, web servers or applications that use the certificate for secure connections.

ACM provides the following features:

1. Automatic renewal: ACM automatically renews your SSL/TLS certificates before they expire, ensuring that your services are always using valid certificates.
1. Secure private keys: ACM stores your private keys in a hardware security module (HSM) for added security.
1. Public certificates: You can use ACM to issue public SSL/TLS certificates that can be used with AWS services and resources, as well as with non-AWS resources.
1. Import certificates: You can import your own certificates to ACM, allowing you to use your existing certificates with AWS services.
1. AWS Resource Access Manager (RAM): You can use ACM with AWS RAM to share SSL/TLS certificates with other AWS accounts.

ACM also integrates with other AWS services, such as Elastic Load Balancing and Amazon CloudFront, so you can easily associate your ACM-issued SSL/TLS certificates with these services. Additionally, you can use the AWS Management Console, the AWS CLI, or the AWS SDKs to automate the process of creating and managing your certificates.

## client based is capable of using either indentity based or certificate based authentication

oQEx7%#6w6VR

clone openvpn github

cd easy-rsa/easyrsa3

./easyrsa init-pki

./easyrsa build-ca nopass

ANIMALS4LIFEVPN

./easyrsa build-server-full server nopass

```bash
aws acm import-certificate --certificate fileb://pki/issued/server.crt --private-key fileb://pki/private/server.key --certificate-chain fileb://pki/ca.crt --profile iamadmin-general
```

The command you provided

# For installing AWS CLIENT VPN software in ubuntu 22.04

```bash
curl https://d20adtppz83p9s.cloudfront.net/GTK/latest/awsvpnclient_amd64.deb -o awsvpnclient_amd64.deb


sudo dpkg -i awsvpnclient_amd64.deb
```

# what is step function

Amazon Step Functions is a service provided by AWS that allows you to coordinate multiple AWS services into serverless workflows. It allows you to model and visualize your application's entire lifecycle as a series of steps, making it easier to understand and troubleshoot your application.

# state machine

A state machine in Amazon Step Functions is a collection of states and the transitions between them. It defines the steps that an application goes through and the actions that are taken at each step. The state machine is defined using the Amazon States Language, which is a JSON- or YAML-based language.

For example, you can use a state machine to coordinate an ETL (extract, transform, and load) process that runs on a schedule, where the state machine defines the steps to extract data from a source, transform the data, and load it into a destination.

Each state in a state machine is represented by an AWS Lambda function, an AWS Step Functions service integration, or a Task. The state machine can also include parallel branching, error handling, and timeout states, allowing you to create more complex workflows.

You can use the AWS Management Console, AWS SDKs, or the AWS CLI to create and manage state machines. Step Functions also includes built-in integration with other AWS services, such as AWS Lambda, AWS Glue, AWS Batch, and more, making it easy to create workflows that involve these services.
