output "container_id" {
  description = "ID van de container"
  value       = docker_container.nginx.id
}

output "image_id" {
  description = "ID van het image"
  value       = docker_image.nginx.id
}