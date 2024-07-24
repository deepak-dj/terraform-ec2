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
	ami = var.ec2_ami
	instance_type = var.ec2_type
	key_name = aws_key_pair.keyssh.key_name
	security_groups = [aws_security_group.allow_ssh.name]
	tags = {
		Name = "demo-instance"
	}
}
