variable "ami" {
	type = string
	description = "This variable is for ec2 instance image"
}

variable "instance_type" {
	type = string
	description = "This variable is for ec2 instance type"
}

variable "env" {
	type = string
	description = "This variable is for the environment type"
}

variable "instance_name" {
	type = string
	default = "my-instance-demo"
}
