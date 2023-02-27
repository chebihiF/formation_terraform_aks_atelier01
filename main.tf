#main.tf
terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker",
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx.latest
  name  = "webserver"
  ports {
    internal = 80
    external = 8000
  }
}
