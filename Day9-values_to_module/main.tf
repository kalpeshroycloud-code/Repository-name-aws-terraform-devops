module "name" {
    source = "../Day9-modules"
  instance_type = "t3.micro"
  ami_id = "ami-01e082ac2f79f3918"
  instance_name = "dev_instance"
  
}