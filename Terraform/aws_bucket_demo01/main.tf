provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo"{
    bucket = "mijn-tf-bucket"

    tags = {
       Name         = "Mijn Bucket"
       Environment  = "Dev"
    }
}

resource "aws_s3_bucket_ownership_controls" "control"{
    bucket = aws_s3_bucket.demo.id
    rule {
        object_ownership = "BucketOwnerPreferred"
    }    
}

resource "aws_s3_bucket_public_access_block" "control"{
    bucket = aws_s3_bucket.demo.id

    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "mijn_acl"{
    depends_on = [
      aws_s3_bucket_ownership_controls.control,
      aws_s3_bucket_public_access_block.control
    ]  
    bucket = aws_s3_bucket.demo.id
    acl = "public-read"  
}
