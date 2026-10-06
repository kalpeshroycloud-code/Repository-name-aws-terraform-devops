variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instance_name" {
  type    = string
  default = "dev_instance"
}

variable "subnet_id" {
  type    = string
  default = ""
}
