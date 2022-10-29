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
 
