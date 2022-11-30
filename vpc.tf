module "eu_knab_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.63.0"

  name = "eu-knab-vpc-prd"
  cidr = var.vpc_cidr[terraform.workspace]

  azs             = var.vpc_availability_zones[terraform.workspace]
  public_subnets  = var.vpc_public_cidrs[terraform.workspace]
  map_public_ip_on_launch = true
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = var.tags
}

output "terraform_workspace" {
    value = terraform.workspace
}