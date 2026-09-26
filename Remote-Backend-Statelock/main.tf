resource "aws_vpc" "vpc_1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "VPC_1"
  }
}

resource "aws_vpc" "vpc_2" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "VPC_2"
  }
}