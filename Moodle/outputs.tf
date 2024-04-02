output "aws_public_ip" {
  description = "Public IP addresses of AWS VMs"
  value = aws_instance.example.public_ip
}

output "aws_private_ip" {
  description = "Private IP addresses of AWS VMs"
  value = aws_instance.example.private_ip
}
