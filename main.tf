# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "MyVPC"
  }
}

# Create a subnet within the VPC
resource "aws_subnet" "mysubnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "MySubnet"
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
}
# Create a default route table and associate it with the subnet
resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "MyRouteTable"
  }
}

resource "aws_security_group" "mysecurity" {
  name        = "mysecurity"
  description = "Security group for ec2"
  vpc_id      = aws_vpc.my_vpc.id

  # Allow inbound SSH traffic from any source
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# Create an SSH key pair
resource "aws_key_pair" "mykeypair" {
  key_name   = "mykeypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCaUjKVueDuXI0aIp3p+/3CdsJVjLqHPGFU1xSNPdIMQrzTko/bDIP3Kkc84q7s+QaL6WmWMBh3RYzeiwLP5YO8vM1enp227h9D46ITjl20FnELCWDIjEkNkPO7GzNwwUoE/g7Fw9LljBcW9Mh4YmcZALbf2MsyPfx3TL28DH+7rJwT+gfigZ1tLQOIMlOLZvA7l1YC/TJZPlq2a+TYDvoO54HVjKC2lXhyPEBVwDiwozTaeR0aDFMhHC76Kg7rZeb35MaFEBYL0yK7Ut1tLjl68K+bchjR4Qpmsb8bjGzNE87CSXEF16eOusCepiqBsCyjxj1HWhrnxu5yKLZ2CcEQD/B/2bl/BWvbRKrSE/9eGN+Q9sFTFBZ2wFimHS3oIVJOSR0YnOnLYSJJN11oVpsxRSRSGN2eqatPids8BYiWavCTTM7ibvT3rySl51tBPiJIvCIoDvzepOgS0JsIbZVRshvd7cu5YYOprT9KdzzDT9ZLNtt+q6UzkCyohKyPrus= sharanya@VER-BLR-LT1970.local" # Replace this with your SSH public key
}

resource "aws_instance" "demo-terraform" {
  ami             = var.ami_id
  instance_type   = var.inst_type
  count           = var.inst_count
  subnet_id       = aws_subnet.mysubnet.id
  key_name        = aws_key_pair.mykeypair.key_name
  security_groups = aws_security_group.mysecurity

  root_block_device {
    volume_size = var.disk_size
    volume_type = "gp2"
  }
  tags = {
    Name = "terraDEvInstance"
  }

}
