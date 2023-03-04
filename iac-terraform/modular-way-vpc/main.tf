# To userstand each and every single option  better please go https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

data "aws_availability_zones" "available" {}
provider "aws" {
  region = var.region
}
resource "random_string" "suffix" {
  length  = 8
  special = false
}
locals {
  cluster_name = "education-eks-${random_string.suffix.result}"
}