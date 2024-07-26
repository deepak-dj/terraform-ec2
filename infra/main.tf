/*
resource "aws_key_pair" "keyssh"{
	key_name = "my-ssh-key" 
	public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_default_vpc" "default_network" {

}

resource "aws_security_group" "allow_ssh" {
	name = "allow-ssh"
	description = "this is a security group"
	vpc_id = aws_default_vpc.default_network.id
	ingress {
		description = "TLS from VPC"
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	tags = {
		Name = "allow_ssh"
	}
}


resource "aws_instance" "demo_instance" {
	count = 2
	ami = var.ec2_ami
	instance_type = var.ec2_type
	
	key_name = aws_key_pair.keyssh.key_name
	security_groups = [aws_security_group.allow_ssh.name]
	
	tags = {
		Name = "demo-instance"
	}
}
*/

module "my_instance-dev" {
	source = "./my_modules"
	ami = "ami-07c8c1b18ca66bb07"
	instance_type = "t3.micro"
	env = "dev"
}

module "my_instance-prd" {
        source = "./my_modules"
        ami = "ami-07c8c1b18ca66bb07"
        instance_type = "t3.medium"
        env = "prd"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-terra-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
