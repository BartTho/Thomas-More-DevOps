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

resource "aws_s3_bucket" "box1" {
  bucket = var.bucket_naam
  tags = {
    Name = var.bucket
  }
}