variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}
variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default = {
    Name = "Demo VPC"
  }
}
