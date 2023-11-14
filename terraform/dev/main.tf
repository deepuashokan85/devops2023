terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.67.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

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
resource "aws_instance" "WEBinstance" {
  ami                         = "ami-087c17d1fe0178315"
  instance_type               = var.instance_type
  count                       = var.instance_count
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip
  tags                        = var.instance_tags
  depends_on = [
    aws_key_pair.kp
  ]
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = var.rsa_bits
}

resource "aws_key_pair" "kp" {
  key_name   = var.key_name
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./myKey.pem"
  }
}

