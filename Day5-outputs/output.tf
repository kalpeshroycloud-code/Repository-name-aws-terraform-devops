output "ip" {
  value = aws_instance.dev.private_ip
  sensitive = true
}
output "public_ip" {
  value = aws_instance.dev.public_ip
  sensitive = true
}

output "instance_id" {
  value = aws_instance.dev.id
  sensitive = true
}
output "instance_ami" {
  value = aws_instance.dev.ami
  sensitive = true
}
output "instance_type" {
  value = aws_instance.dev.instance_type
  sensitive = true
}

output "instance_key_name" {
  value = aws_instance.dev.key_name
    sensitive = true
}

output "instance_availability_zone" {
  value = aws_instance.dev.availability_zone
    sensitive = true
}
