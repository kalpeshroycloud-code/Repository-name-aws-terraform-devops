resource "aws_instance" "name" {
  ami               = "ami-03cc2fdb1443ab619"
  instance_type     = "t3.micro"
  key_name          = "outputkeypair"
  availability_zone = "eu-north-1a"

  tags = {
    Name = "MyInstance_17-sep"
  }
}
resource "aws_s3_bucket" "name" {
    bucket = "bucketthanksyouterraform" 
  
}