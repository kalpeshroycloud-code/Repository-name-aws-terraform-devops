resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC_RDS"
  }
}

resource "aws_subnet" "name" {
  vpc_id            = aws_vpc.name.id
  cidr_block        = "10.0.1.0/24"
availability_zone = "eu-north-1a"
  tags = {
    Name = "Subnet_RDS"
  }
}

resource "aws_subnet" "name2" {
  vpc_id            = aws_vpc.name.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-north-1b"

  tags = {
    Name = "Subnet_RDS_2"
  }
}

resource "aws_security_group" "name" {
  name        = "sg_rds"
  description = "Security group for RDS"
  vpc_id      = aws_vpc.name.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}   
resource "aws_db_subnet_group" "name" {
  name       = "db_subnet_group"
  subnet_ids = [aws_subnet.name.id, aws_subnet.name2.id]

  tags = {
    Name = "DB Subnet Group"
  }
}

resource "aws_db_instance" "name" {
  identifier = "my-rds-instance"
    allocated_storage    = 20
    engine               = "mysql"
    engine_version       = "8.0"
    instance_class       = "db.t2.micro"
    username             = "admin"
    password             = "mypassword"
    #manage_master_user_password = true rds with secret manager secrets will be in secrets manager
    db_subnet_group_name = aws_db_subnet_group.name.name
    vpc_security_group_ids = [aws_security_group.name.id]   
    skip_final_snapshot   = true
    maintenance_window      = "Mon:00:00-Mon:03:00"
    backup_window           = "03:00-06:00"

}