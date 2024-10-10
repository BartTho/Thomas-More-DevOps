variable "docker_image_naam" {
  description = "Naam van de docker image"
  type        = string
  default     = "nginx:latest"
}
variable "docker_container_naam" {
  description = "Naam van de docker container"
  type        = string
  default     = "www1"
}