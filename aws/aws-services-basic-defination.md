# Basic defination of service we will be mostly using in our projects

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

The command you provided is used to import an existing certificate, private key, and certificate chain into AWS Certificate Manager (ACM) using the AWS Command Line Interface (CLI).

Here's a breakdown of the command:

"aws acm import-certificate" - This command is used to import a certificate into ACM.
"--certificate fileb://pki/issued/server.crt" - This option specifies the location of the certificate file (in this case, "pki/issued/server.crt") that you want to import. The "fileb" protocol is used to specify that the file is located on the local file system.
"--private-key fileb://pki/private/server.key" - This option specifies the location of the private key file (in this case, "pki/private/server.key") that is associated with the certificate. The private key is used to decrypt the certificate and validate the authenticity of the certificate when it's being used.
"--certificate-chain fileb://pki/ca.crt" - This option specifies the location of the certificate chain file (in this case, "pki/ca.crt") that is associated with the certificate. The certificate chain file contains the certificate of the issuing CA (Certificate Authority) and any intermediate CA certificates that are required to validate the authenticity of the certificate.
Once you run this command, the certificate, private key, and certificate chain will be imported into ACM and can be used to secure your website or application on AWS.

It's important to note that the certificate must be issued by a public CA, and not by a private one. Also, the certificate, private key, and certificate chain must be in PEM format.

# For installing AWS CLIENT VPN software in ubuntu 22.04

```bash
curl https://d20adtppz83p9s.cloudfront.net/GTK/latest/awsvpnclient_amd64.deb -o awsvpnclient_amd64.deb


sudo dpkg -i awsvpnclient_amd64.deb
```
