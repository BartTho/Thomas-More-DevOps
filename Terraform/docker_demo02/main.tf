#https://www.terraform.io/
#https://registry.terraform.io/browse/providers
#terraform init
#terraform plan
#terraform apply
#terraform output

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = var.docker_image_naam
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.docker_container_naam
  ports {
    internal = 80
    external = 7000
  }
}

resource "docker_network" "public" {
    name = "mijn_Netwerk"
}