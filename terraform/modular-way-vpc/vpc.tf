module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name = "education-vpc"
  cidr = "10.0.0.0/16"
    #How Slicing works in Terraform
    #slice(list, startindex, endindex)
  azs  = slice(data.aws_availability_zones.available.names, 0, 3)
   #We can also use variable for that as we did in prevoius section to create a bit more modularity
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  enable_nat_gateway   = true
#If single_nat_gateway = true, then all private subnets will route their Internet traffic through this single NAT gateway. 
# The NAT gateway will be placed in the first public subnet in your public_subnets block.
  single_nat_gateway   = true
  enable_dns_hostnames = true
  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
 
}