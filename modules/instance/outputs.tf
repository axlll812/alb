output "public_dns" {
   value = aws_instance.ws.public_dns
}

output "ec2_id" {
   value = aws_instance.ws.id
}

output "availability_zones" {
   value = aws_instance.ws.availability_zone
}

output "arn" {
   value = aws_instance.ws.arn
}