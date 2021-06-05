output "names" {
  value = aws_lightsail_static_ip.this.*.name
}