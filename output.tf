# Output VPC id
output "vpc_id" {
  value = module.eu_knab_vpc.vpc_id
}

# Output public subnet id
output "public_subnet_id" {
  value = module.eu_knab_vpc.public_subnets
}

# Output ec2 security group id
output "ec2_sg" {
  value = aws_security_group.ec2-sg.id
}

# Output public ip of ec2 instance
output "ec2_public_ip" {
  value = aws_instance.web[0].public_ip
}