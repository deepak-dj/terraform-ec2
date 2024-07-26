output "aws_arn" {
	value = aws_instance.my-module-instance[*].arn
}

output "aws_ip" {
	value = aws_instance.my-module-instance[*].public_ip
}

