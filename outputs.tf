output "Instance_elastic_ip" {
  value = aws_eip_association.eip_assoc.public_ip
}
