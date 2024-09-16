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
resource "aws_instance" "my_instance" {
  ami           = var.ami_id # Replace with a valid AMI ID
  instance_type = var.inst_type

  tags = {
    Name = "terraEC2Instance"
  }
}
