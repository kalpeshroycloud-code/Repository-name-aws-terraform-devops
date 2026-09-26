resource "aws_instance" "import" {
 ami           = "ami-0dff49db4feb026af"
  instance_type = "t3.micro"    
key_name      = "outputkeypair"
tags = {
    Name = "import"
  }
}