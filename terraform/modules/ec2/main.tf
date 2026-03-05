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
module "ec2_instance" {
  source = "./ec2"
  ami_value = "ami-0e86e20dae9224db8"
  instance_type_value = "t2.micro"
  subnet_id_value = "subnet-0e6adcd743f850cfc"
}
