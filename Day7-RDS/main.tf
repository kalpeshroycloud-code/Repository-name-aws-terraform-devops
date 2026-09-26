resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  multi_az             = true
  db_subnet_group_name = aws_db_subnet_group.kalpesh.name
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}

resource "aws_db_subnet_group" "kalpesh" {
    name       = "my-custom-subnet-group"
    subnet_ids = ["subnet-016f730ca0ff5e56d", "subnet-0b14e3784d5341f33"]
    tags = {
    Name = "My custom subnet group"
  }
}