
#https://www.terraform.io/
#https://registry.terraform.io/browse/providers
#terraform init
#terraform validate
#terraform plan
#terraform apply
#terraform show
#terraform state list
#terraform distroy

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
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"
  ports {
    internal = 80
    external = 7000
  }
}
