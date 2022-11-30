# Create instance for the web
resource "aws_instance" "web" {
  count             = var.instance_count
  ami               = lookup(var.ami, var.aws_region)
  instance_type     = "t3.micro"
  subnet_id         = module.eu_knab_vpc.public_subnets

  vpc_security_group_ids      = [aws_security_group.ec2-sg.id]
  associate_public_ip_address = true

  key_name          = aws_key_pair.europe-region-key-pair.id
  user_data         = file("${path.module}/docker_nginx.sh")
  
  tags = var.tags
}

#key pair
resource "aws_key_pair" "europe-region-key-pair" {
    key_name = "europe-region-key-pair"
    public_key = file(var.public_key_path)
}

# security group
resource "aws_security_group" "ec2-sg" {

    vpc_id = module.eu_knab_vpc.vpc_id

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        
        // This means, all ip address are allowed to ssh !
        // Do not do it in the production. Put your own ip address in it!
        cidr_blocks = ["0.0.0.0/0"]
    }

    //If you do not add this rule, you can not reach the NGIX
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = var.tags
}