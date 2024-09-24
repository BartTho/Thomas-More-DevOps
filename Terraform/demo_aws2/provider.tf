terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  access_key = ""
  secret_key = ""
  token=""
  region = "us-east-1"
}