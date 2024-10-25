output "s3_bucket_id" {
  description = "The name of the bucket."
  value       =  aws_s3_bucket.box1.id
}
output "s3_bucket_bucket_domain_name" {
  description = "The name of the bucket."
  value       =  aws_s3_bucket.box1.bucket_domain_name
}
output "s3_bucket_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL."
  value       = aws_s3_bucket.box1.bucket_regional_domain_name
}

output "s3_bucket_policy" {
  description = "The policy of the bucket, if the bucket is configured with a policy. If not, this will be an empty string."
  value       = aws_s3_bucket.box1.acl
}
