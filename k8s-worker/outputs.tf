output "public_ips" {
  value = aws_lightsail_instance.this.*.public_ip_address
}

output "private_ips" {
  value = aws_lightsail_instance.this.*.private_ip_address
}
