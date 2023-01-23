# AWS client VPN for accesing private resource in AWS

## Require tools and prerequesit

AWS account

Terrafrom,AWS

For Installing these tools

[Terrafrom](https://www.terraform.io/downloads/)

[AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

## steps

1. create a vpc
1. Generate server certificates and keys (need in third step)
1. create a AD (we need in third step for user based authentication)
1. Create a Client VPN endpoint
1. Associate a target network
1. Authorize to Resources (i.e your VPC)

# create a VPC

we are using terraform creating VPC , you can use whatever you like , end goal for this step you should have vpc with private subnet so we can simulate a connection between your local machine to VPC private resources

create a directory in your local machine and create two file name variable.tf and vpc.tf for creating a VPC with terraform
copy and paste the following code

```tf
#defining region
provider "aws" {
  region = var.region
}
# VPC
resource "aws_vpc" "default" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.project}-vpc",

  }
}

# Creating Public subnets
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_blocks)
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

   tags = {
    Name = "${var.project}-pub-subnet-${substr(var.availability_zones[count.index], 8, 2)}",
  }
}
# Creating Private subnets
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
    tags = {
    Name = "${var.project}-priv-subnet-${substr(var.availability_zones[count.index], 8, 2)}",
  }
}

# Creating internet gateway for accesing to internet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.default.id
}
# create route table with a record to internet incase of 0.0.0.0
resource "aws_route_table" "public-rt" {
 vpc_id = aws_vpc.default.id

 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.igw.id
 }

 tags = {
   Name = "public-rt"
 }
}


resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "default" {
  depends_on = [aws_internet_gateway.igw]
  allocation_id = aws_eip.nat.id
  # Launching aws nat gateway in public subnet
  subnet_id     = aws_subnet.public[1].id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.default.id
   tags = {
   Name = "nat-gateway-rt"
 }
}
resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.default.id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr_blocks)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr_blocks)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public-rt.id
}
```

in varible.tf file

```tf
variable "public_subnet_cidr_blocks" {
  default     = ["10.0.0.0/24", "10.0.2.0/24"]
  type        = list
  description = "List of public subnet CIDR blocks"
}
variable "region" {
  default     =  "us-east-1"
  type        = string
}
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  type        = string
}
variable "project" {
  default     =  "katra"
  type        = string
}
variable "private_subnet_cidr_blocks" {
  default     = ["10.0.100.0/24", "10.0.101.0/24"]
  type        = list
  description = "List of private subnet CIDR blocks"
}

variable "availability_zones" {
  default     = ["us-east-1a", "us-east-1b","us-east-1c"]
  type        = list
  description = "List of availability zones"
}
```

Client VPN offers the following types of client authentication:

Active Directory authentication (user-based)

Mutual authentication (certificate-based)

Single sign-on (SAML-based federated authentication) (user-based)

server certificate must be generete for any one of ways.

**we are doing with Mutual authentication**

# Create Directory Service

choose simple AD

choose small size

give directory DNS name katra.example.com

give directory NetBIOS name CORP

choose passowrd h&xwCy5%tuG#

next

choose your vpc in my case katra

choose min two priv sub nets

review

you should see status creting , it will take 5 to 10 mints

## Generate server certificates and keys

```bash

cd /tmp

git clone https://github.com/OpenVPN/easy-rsa.git

cd easy-rsa/easyrsa3

./easyrsa init-pki

./easyrsa build-ca nopass

  #choose-name, in my case katra

./easyrsa build-server-full server nopass
 #type yes to continue

aws acm import-certificate --certificate fileb://pki/issued/server.crt --private-key fileb://pki/private/server.key --certificate-chain fileb://pki/ca.crt

```

OUTPUT

```json
{
  "CertificateArn": "arn:aws:acm:us-east-1:085935842926:certificate/b72e64df-db0e-4342-8b85-329cfffe4656"
}
```

last command is used to import an existing certificate, private key, and certificate chain into AWS Certificate Manager (ACM) using the AWS Command Line Interface (CLI).

Here's a breakdown of the command:

"aws acm import-certificate" - This command is used to import a certificate into ACM.
"--certificate fileb://pki/issued/server.crt" - This option specifies the location of the certificate file (in this case, "pki/issued/server.crt") that you want to import. The "fileb" protocol is used to specify that the file is located on the local file system.

"--private-key fileb://pki/private/server.key" - This option specifies the location of the private key file (in this case, "pki/private/server.key") that is associated with the certificate. The private key is used to decrypt the certificate and validate the authenticity of the certificate when it's being used.

"--certificate-chain fileb://pki/ca.crt" - This option specifies the location of the certificate chain file (in this case, "pki/ca.crt") that is associated with the certificate. The certificate chain file contains the certificate of the issuing CA (Certificate Authority) and any intermediate CA certificates that are required to validate the authenticity of the certificate.

Once you run this command, the certificate, private key, and certificate chain will be imported into ACM and can be used to secure your website or application on AWS.

It's important to note that the certificate must be issued by a public CA, and not by a private one. Also, the certificate, private key, and certificate chain must be in PEM format.

# Create a Client VPN endpoint

The address range cannot overlap with the target network address range, the VPC address range, or any of the routes that will be associated with the Client VPN endpoint. The client address range must be at minimum /22 and not greater than /12 CIDR block size. You cannot change the client address range after you create the Client VPN endpoint

https://console.aws.amazon.com/vpc/

choose vpc in serivce , open in new page ,
from left sidebar , in vpn section choose client vpn

name
katra-vpn-endpoint

192.168.12.0/22

CIDR block cannot be larger than /12 or smaller than /22.

choose server certificate we uploaded in previous step

in Authentication options choose userbased auth
under active directory choose directory you created in previous step

copy DNS from active directory

enable split tunneling

Split tunneling is a feature of the AWS Client VPN that allows clients to access resources in the VPC while also having internet access on their device. With split tunneling, only the traffic destined for the VPC is routed over the VPN connection, while all other traffic is sent directly to the internet.

hit create VPN endpoint , state will be pending-associate

# Associate a target network

we will associate a subnet of private subnet so vpn can give ip address from this subnet when we connect to VPN,

click VPN you created , under Target network associations click Associate target network , then choose VPC and a choose a priv subnet

state should be associating

, download configuration file

open aws vpn clinet software
create aprofile and provide any name with the file you just downloaded

now ping DNS server of Service Directory (All packet will lost , because we will have to Autherize the resources)

# Authorize to Resources (i.e your VPC)

last step is to add authorize rule to VPN to access your resource through VPN

and test private resource with internal DNS for resource
