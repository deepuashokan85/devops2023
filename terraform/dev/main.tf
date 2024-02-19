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

