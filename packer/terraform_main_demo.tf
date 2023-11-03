data "aws_ssm_parameter" "prod" {
  name = "velayutham"
}

resource "aws_instance" "web_instance" {
  ami                         = element(split(",", data.aws_ssm_parameter.prod.value), 0)
  instance_type               = "t2.micro"
  count                       = 1
  associate_public_ip_address = true
  tags = {
    Name = "Web Instance"
  }
}
