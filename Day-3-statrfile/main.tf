provider "aws" {
  region = "sa-east-1"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "name" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.small"
  key_name      = "LB_LAB1"
  tags = {
    Name = "LB_LAB1"
  }
}