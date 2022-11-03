resource "aws_vpc" "vpc_v3" {
    cidr_block = var.vpc_cidr
    tags = merge(local.common_tags , { Name = replace(local.name, "rtype" , "vpc")})
}

resource "aws_subnet" "public_subnet" {
    count = length(var.public_subnet_cidr)
    vpc_id = aws_vpc.vpc_v3.id
    cidr_block = element(var.public_subnet_cidr, count.index)
    availability_zone = element(var.az, count.index)
    tags = merge(local.common_tags, { Name = replace(local.name, "rtype", "public_subnet")})
}
resource "aws_subnet" "private_subnet" {
    count = length(var.private_subnet_cidr)
    vpc_id = aws_vpc.vpc_v3.id
    cidr_block = element(var.private_subnet_cidr, count.index)
    availability_zone = element(var.az, count.index)
    tags = merge(local.common_tags, { Name = replace(local.name, "rtype", "private_subnet")})
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.vpc_v3.id
   route {
    
    cidr_block = var.cidr_block
    gateway_id = aws_internet_gateway.ingw.id
   }
tags = merge(local.common_tags, { Name = replace(local.name, "rtype", "public_rt")})
    
}

resource "aws_route_table_association" "public_subnet" {
    count = length(var.public_subnet_cidr)
    subnet_id = element(aws_subnet.public_subnet.*.id, count.index)
    route_table_id = aws_route_table.public_rt.id
    
}

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.vpc_v3.id
   route {
    
    cidr_block = var.cidr_block
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
}
    tags = merge(local.common_tags, { Name = replace(local.name, "rtype", "private_rt")})
    
}

resource "aws_route_table_association" "private_subnet" {
    count = length(var.private_subnet_cidr)
    subnet_id = element(aws_subnet.private_subnet.*.id, count.index)
    route_table_id = aws_route_table.private_rt.id
   
}

resource "aws_internet_gateway" "ingw" {
 vpc_id = aws_vpc.vpc_v3.id
 tags = merge(local.common_tags, {Name = replace(local.name, "rtype" , "ingw")})   
}

resource "aws_eip" "eip"{
    vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  subnet_id         = aws_subnet.public_subnet[0].id
  allocation_id = aws_eip.eip.id
  tags = merge(local.common_tags, { Name = replace(local.name, "rtype", "nat")})
  }