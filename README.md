# terraform-aws-docker-nginx
Repository which creates an integrated and fully automated script which builds a secure network context and then deploys a container in which nginx web server is running

## Project Structure and File Description
```
project
│   *README.md           
│   *docker_nginx.sh     --> Script to install Docker and Nginx Image
│   *versions.tf         --> AWS Provider and Key Pair
│   *ec2.tf              --> EC2 instances and ec2 security group
│   *vpc.tf              --> Terraform AWS VPC module
│   *output.tf           --> Outputs VPC id, public subnet ids, security group id
│   *variables.tf        --> Defines variables
```
## Expectations
When terraform configuration is applied, a VPC is created along with public subnets and it has EC2 instance that will provision a Nginx Docker container with an availability zone based on the region.

## How to Use

### Requirements
To use terraform configuration, make sure you have the following:
- An AWS account
- AWS CLI installed
- terraform version 1.3.5 installed
- keypair created (to ssh into instances)

### Terraform AWS VPC Module
source  = "terraform-aws-modules/vpc/aws"
This is the reusable module created by aws and available in terraform registry.

The module internally creates resources such as VPC, Public Subnet, internet gateway, Route table, Route table association, Network ACL with inbound and outbound rules, default VPC security group rules)

### Default Ami (Ubuntu 22.04)
- `eu-central-1` = ami-0caef02b518350c8b

### Credentials and Setting Variables 
To start, replace access_key and secret_key variables in variables.tf file

### Launch Infrastructure
Run these terraform commands to launch the insfrastructure based on the configuration provided
```
$ ssh-keygen -f europe-region-key-pair
$ terraform init
$ terraform plan
$ terraform apply
```
### Destroy Infrastructure
Run this terraform command to destroy the insfrastructure
```
$ terraform destroy
```
### Connect to nginx application
copy public ip of the ec2 instance either from output variable ec2_public_ip or copy from aws web console and hit the below url
http://<public_ip>:80

