output "s3_bucket_name"{
    value = aws_s3_bucket.b.id
}

output "cloudfront_distribution_domain_name"{
    value = aws_s3_bucket.b.bucket_domain_name
}