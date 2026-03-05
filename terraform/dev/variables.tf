variable "aws_region" {
  description = "Target AWS region"
  default     = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "devops-project"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "database_subnets" {
  type    = list(string)
  default = ["10.0.20.0/24", "10.0.21.0/24"]
}

variable "instance_type" {
  default = "t2.micro"
}

variable "db_name" {
  default = "production_db"
}

