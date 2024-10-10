provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = var.instantie_ami 
  instance_type = var.instantie_type 

  tags = {
    Name = var.instantie_naam
  }
}