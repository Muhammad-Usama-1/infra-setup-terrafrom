provider "aws" {
    region = "us-east-1"
  
}
module "kubernetes" {
    source = "./kubernetes"
    vpc_cidr_block = "10.240.0.0/16"
  
} 