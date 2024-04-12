
// TODO break public and private into separate AZs
data "aws_availability_zones" "available" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name                             = "${var.namespace}-vpc"
  cidr                             = var.vpc_cidr
  azs                              = data.aws_availability_zones.available.names
  private_subnets                  = var.private_subnets
  public_subnets                   = var.public_subnets
  #assign_generated_ipv6_cidr_block = true
  create_database_subnet_group     = true
  enable_nat_gateway               = false
  single_nat_gateway               = false
}

// SG to allow SSH connections from anywhere
resource "aws_security_group" "public" {
  name        = "${var.namespace}-SG"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = var.SG_Ports
    content {
      description = "SSH from the internet"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.SG_cidr_Public
    }
    
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.SG_cidr_Public
  }

  tags = {
    Name = "${var.namespace}-SG"
  }
}


