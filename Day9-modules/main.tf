resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

tags = {
 Name = "test_instance"
}
  
  #tags = merge(
   # {
    #  Name = var.instance_name
    #}
  #)
}