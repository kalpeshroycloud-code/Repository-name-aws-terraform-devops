# Create VPC

resource "aws_vpc" "prod" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "prod"
  }
}


# Create subnet in VPC

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.prod.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod-subnet"
  }
}


#creating private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.prod.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "prod-private-subnet"
  }
}

#create NAT for private subnet
#create RT for private subnet
#rt association for private subnet

# Create Internet Gateway and attach to VPC

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.prod.id

  tags = {
    Name = "prod-igw"
  }
}


# Create route table

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.prod.id

  route {
    gateway_id = aws_internet_gateway.igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "prod-route-table"
  }
}


# Subnet association with route table

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route_table.id
}


# Security group for EC2 instance

resource "aws_security_group" "sg" {
  name        = "prod-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.prod.id

  # Inbound SSH rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound HTTP rule
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "prod-sg"
  }
}


# Create EC2 instance

resource "aws_instance" "name" {
  ami           = "ami-03cc2fdb1443ab619"
  instance_type = "t3.micro"
  key_name      = "outputkeypair"
  subnet_id = aws_subnet.subnet.id

  vpc_security_group_ids = [
    aws_security_group.sg.id
  ]

  tags = {
    Name = "prod-instance"
  }
}