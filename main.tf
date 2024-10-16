variable "port_number" {
    type = number
    description = "The docker container port "
    sensitive = false
}
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "MyFirstContainer"
 // tag = {
 //   name= "nginx_container"
  //}

  ports {
    internal = 80
    external = 8000
  }
}

output "debug_container" { 
  value = docker_image.nginx.image_id
}