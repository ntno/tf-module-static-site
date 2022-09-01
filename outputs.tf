output "arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.s3_bucket.id
}

output "website_domain" {
  description = "Domain name of the bucket"
  value       = aws_s3_bucket.s3_bucket.website_domain
}

output "website_url" {
  description = "URL for s3 site"
  value       = format("http://%s.%s", aws_s3_bucket.s3_bucket.id, aws_s3_bucket.s3_bucket.website_domain)
}