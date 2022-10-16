output "content_bucket_info" {
  description = "Map containing the content bucket's arn, id, domain, website endpoint, and s3 url"
  value = {
    "arn"              = aws_s3_bucket.s3_content_bucket.arn
    "id"               = aws_s3_bucket.s3_content_bucket.id
    "website_domain"   = aws_s3_bucket.s3_content_bucket.website_domain
    "website_endpoint" = aws_s3_bucket_website_configuration.s3_content_bucket_website_configuration.website_endpoint
    "s3_url"           = format("http://%s.%s", aws_s3_bucket.s3_content_bucket.id, aws_s3_bucket.s3_content_bucket.website_domain)
  }
}

output "www_subdomain_bucket_info" {
  description = "Map containing the www subdomain bucket's arn, id, domain, website endpoint, and s3 url"
  value = {
    "arn"              = aws_s3_bucket.s3_www_subdomain_bucket.arn
    "id"               = aws_s3_bucket.s3_www_subdomain_bucket.id
    "website_domain"   = aws_s3_bucket.s3_www_subdomain_bucket.website_domain
    "website_endpoint" = aws_s3_bucket_website_configuration.s3_www_subdomain_bucket_website_configuration.website_endpoint
    "s3_url"           = format("http://%s.%s", aws_s3_bucket.s3_www_subdomain_bucket.id, aws_s3_bucket.s3_www_subdomain_bucket.website_domain)
  }
}

output "cloudfront_distribution_info" {
  description = "Map containing the cloudfront distribution's arn, id, domain name, hosted zone id"
  value = {
    "arn"            = aws_cloudfront_distribution.cloudfront_distribution.arn
    "id"             = aws_cloudfront_distribution.cloudfront_distribution.id
    "domain_name"    = aws_cloudfront_distribution.cloudfront_distribution.domain_name
    "hosted_zone_id" = aws_cloudfront_distribution.cloudfront_distribution.hosted_zone_id
  }
}