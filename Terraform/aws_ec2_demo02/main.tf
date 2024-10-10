provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  #ami           = "ami-0888db1202897905c"
  ami           = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}