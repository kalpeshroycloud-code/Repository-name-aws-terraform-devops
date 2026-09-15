resource "aws_instance" "name" {
  ami           = "ami-0eb682d4195b2f553"
  instance_type = "t3.micro"
  key_name      = "LB_LAB1"

  tags = {
    Name = "Terraform-EC2"
  }
}

resource "aws_s3_bucket" "name" {
    bucket = "bucketfromremotevscode"
  
}
