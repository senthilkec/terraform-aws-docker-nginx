variable "aws_region" {
  description = "The region on AWS to deploy the infrastructure"
  default     = "eu-central-1"
}

variable "access_key" {
  description = "The access key for AWS account"
  default     = ""
}



variable "secret_key" {
  description = "The access key for AWS account"
  default     = ""
}


variable "vpc_availability_zones" {
  default = {
    eu-knab-prd = ["eu-central-1a"]
  }
}

variable "vpc_cidr" {
  type = map(string)
  default = {
    eu-knab-prd = "10.0.0.0/16"
  }
}

variable "vpc_public_cidrs" {
  description = "The CIDR block for the public subnet"
  default = {
    eu-knab-prd = ["10.0.1.0/24"]
  }
}   

variable "ami" {
  type = map(string)
  default = {
    eu-central-1 = "ami-0caef02b518350c8b"
  }
}

variable "private_key_path" {
  default = "europe-region-key-pair"
}

variable "public_key_path" {
  default = "europe-region-key-pair.pub"
}

variable "ec2_user" {
  default = "ubuntu"
}

variable "tags" {
  type = map(string)
  default = {
    CreatedBy    = "Terraform"
    Environment = "PROD"
  }
}

# Public Key to access EC2 instances
variable "key_name" {
  description = "The public key for EC2 instances"
  default = "knab"
}

# Total instances to provision
variable "instance_count" {
  description = "Total number of instances"
  default = "1"
}