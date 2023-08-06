resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/24"
}

#resource "aws_instance" "my_instance" {
#ami           = var.ami_id  # Replace with a valid AMI ID
#instance_type = var.inst_type
#subnet_id     = aws_subnet.my_subnet.id

#tags = {
#Name = "terraEC2Instance"
#}
#}

resource "aws_internet_gateway" "devops-igw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "Devopsroute" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.devops-igw.id
  }
}
