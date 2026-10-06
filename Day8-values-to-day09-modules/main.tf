module "test" {
  source = "../Day9-modules"
  instance_type = "t2.micro"

  ami_id = "ami-0c55b159cbfafe1f0"
  
}