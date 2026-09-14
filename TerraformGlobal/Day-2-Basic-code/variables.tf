variable "ami_id" {
  description = "inserting AMI value"
  type        = string
  default     = ""
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}



variable "instance_type" {
  description = "inserting instance type"
  type        = string
  default     = ""
  
}


variable "key_name" {
  description = "inserting key name"
  type        = string
  default     = ""
  
}


variable "subnet_id" {
  description = "inserting subnet id"
  type        = string
  default     = ""
  
}