output "instance_id" {
  description = "ID van de EC2 instantie"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Publiek IP-address van de EC2 instantie"
  value       = aws_instance.app_server.public_ip
}