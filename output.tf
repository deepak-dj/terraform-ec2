output "aws_arn" {
	value = aws_instance.demo_instance.arn
}

output "aws_ip" {
	value = aws_instance.demo_instance.public_ip
}
