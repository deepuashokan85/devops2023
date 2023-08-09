variable "ami_id" {
  type    = string
  default = "ami-0f34c5ae932e6f0e4"
}

variable "inst_type" {
  type    = string
  default = "t2.micro"
}

variable "inst_count" {
  default = 1
}

variable "key_pair_name" {
  type    = string
  default = "demokeypair"
}

variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQcgTViTn/rzTjuxE5Dd1jrqVVWnyz1hHpK/sq9DtSJ8XR8xrm5bXEIHtXf88ByO7ElRBsxd2BuXPzPvEyxymFP7TtLM6P4lY3GXqsTt5NFT+Nk7o2vrTQc3eInPCH7P4qhAMq93BGFsRiO0Arey8y2A/weEwZoHOvPCuCGeF3r579Z0eMf6XxrFqVzevoZiVs3ZJnBmP62JGVJajsBxxj7j7erlmFTXPbHRJMVHzaj20jMeX8AV6HeFe1lcRDuG8NVKlFpRN79HNbC8qiGkwBgJ2RkVhc21Ugo8zVnnsJR/63PTjnBmBWkQp0Qn7lxy13u6TB3x+AVbP9YMcMNtiX Balaraju.k@Balaraja-K"
}

variable "disk_size" {
  default = 8
}
