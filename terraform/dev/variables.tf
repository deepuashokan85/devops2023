variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "web_subnet_cidr" {
  description = "The CIDR block for web subnets"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "application_subnet_cidr" {
  description = "The CIDR block for application subnets"
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
}

variable "db_subnet_cidr" {
  description = "The CIDR block for database subnets"
  type        = list(string)
  default     = ["10.0.4.0/24"]
}

variable "instance_count" {
  description = "The number of instances to create"
  type        = number
  default     = 2
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
}

variable "db_allocated_storage" {
  description = "The allocated storage for the DB instance"
  type        = number
  default     = 20
}

variable "db_storage_type" {
  description = "The storage type for the DB instance"
  type        = string
  default     = "gp2"
}

variable "db_engine" {
  description = "The DB engine (e.g., mysql)"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "The DB engine version (e.g., 5.7)"
  type        = string
  default     = "5.7"
}

variable "db_instance_class" {
  description = "The DB instance class"
  type        = string
  default     = "db.t2.micro"
}

variable "db_username" {
  description = "The DB username"
  type        = string
  default     = "mydbuser"
}

variable "db_password" {
  description = "The DB password"
  type        = string
  default     = "mydbpassword"
}

variable "ssh_ingress_cidr" {
  description = "CIDR block for SSH ingress"
  type        = string
  default     = "0.0.0.0/0"
}


