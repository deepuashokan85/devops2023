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

