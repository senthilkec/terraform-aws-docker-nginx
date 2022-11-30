terraform {
  required_version = "~> 1.2"

// commenting out the remote state storage as this is not in scope of assignment
/*   backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "terraform.tfstate"
    dynamodb_table = "terraform-state-lock"
    region         = "eu-central-1"
  } */

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.aws_region
}