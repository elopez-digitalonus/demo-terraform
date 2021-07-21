output "sg_dmz_id" {
  value       = aws_security_group.sg_subnet_0545_dmz.id
  description = "SG id for 0545 dmz"
}


output "subnet_dmz_id" {
  value       = aws_subnet.subnet_0545_dmz.id
  description = "Subnet dmz id"
}


output "kms_key_id" {
  value       = aws_kms_key.kms_0545_key.key_id
  description = "KMS key id"
}
