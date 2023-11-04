# vpc creation
resource "aws_vpc" "demovpc" {
  cidr_block = var.vpc_cidr_block
  tags      = var.vpc_tags
}

# Creating 1st web subnet
resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.public_subnet_az
  tags                    = var.public_subnet_tags
}

