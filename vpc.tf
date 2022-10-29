# VPC
resource "aws_vpc" "default" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.project}-vpc",
    
  }
}

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

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
    tags = {
    Name = "${var.project}-priv-subnet-${substr(var.availability_zones[count.index], 8, 2)}",   
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.default.id
}
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