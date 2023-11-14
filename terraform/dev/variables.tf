variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16" 
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "public_subnet_az" {
  description = "Availability Zone for the public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = {
    Name = "Demo VPC"
  }
}

variable "public_subnet_tags" {
  description = "Tags for the public subnet"
  type        = map(string)
  default     = {
    Name = "Web Subnet 1"
  }
}
variable "instance_count" {
  description = "Number of EC2 instances to create"
  default     = 2
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the AWS key pair"
  default     = "myKey"
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP address with instances"
  default     = true
}

variable "instance_tags" {
  description = "Tags for the EC2 instances"
  type        = map(string)
  default     = {
    Name = "WEB Instance"
  }
}

variable "rsa_bits" {
  description = "Number of bits in the RSA key"
  default     = 4096
}

