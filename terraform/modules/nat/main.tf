resource "aws_eip" "nat1" {
  depends_on = [aws_internet_gateway.main]
}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    name = "main"
  }
}
resource "aws_subnet" "public_1" {
  vpc_id                 = aws_vpc.main.id
  cidr_block             = "10.0.0.0/20"
  availability_zone      = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    name = "main"
  }
}
resource "aws_nat_gateway" "gw1" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.public_1.id
  tags = {
    name = "NAT 1"
  }
}
