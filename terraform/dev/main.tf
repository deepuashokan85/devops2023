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
# s3 bucket creation
resource "aws_s3_bucket" "onebuck1" {
  bucket = var.buck_name
}
