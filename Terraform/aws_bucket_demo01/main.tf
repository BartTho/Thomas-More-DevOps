terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.72.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"

  tags = {
    Name = "app_server1"
  }
}