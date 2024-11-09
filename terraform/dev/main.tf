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
# instance creation
resource "aws_instance" "example" {
    ami = var.ami_value
    instance_type = var.instance_type
    subnet_id = var.subnet_id
}
