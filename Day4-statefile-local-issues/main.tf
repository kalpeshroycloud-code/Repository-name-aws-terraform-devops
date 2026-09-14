resource "aws_instance" "name" {
    ami           = ami-0eb682d4195b2f553
    instance_type = t3.micro
    key_name      = LB_LAB1
    
  
}