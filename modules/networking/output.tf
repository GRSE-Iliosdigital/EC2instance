output "vpc" {
  value = module.vpc
}

output "sg_pub_id" {
  value = aws_security_group.public.id
}

output "sg_priv_id" {
  value = aws_security_group.public.id
}