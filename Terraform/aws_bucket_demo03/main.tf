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

resource "aws_s3_bucket_ownership_controls" "voorbeeld" {
  bucket = aws_s3_bucket.box1.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "voorbeeld" {
   bucket = aws_s3_bucket.box1.id
   block_public_acls = false
   block_public_policy = false
   ignore_public_acls = false
   restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "voorbeeld" {
    depends_on = [ 
        aws_s3_bucket_ownership_controls.voorbeeld,
        aws_s3_bucket_public_access_block.voorbeeld
    ]
    bucket = aws_s3_bucket.box1.id
    acl = "public-read"
}

resource "aws_s3_object" "bestanden" {
  bucket = aws_s3_bucket.box1.id
  for_each = fileset("data/", "**/*.*")

  key = each.value
  source = "data/${each.value}"
  content_type = each.value
}
