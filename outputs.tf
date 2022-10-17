output "content_bucket_info" {
  description = "Map containing the content bucket's arn, id, regional domain, website endpoint, and s3 website url"
  value = {
    "arn"                     = aws_s3_bucket.s3_content_bucket.arn
    "id"                      = aws_s3_bucket.s3_content_bucket.id
    "regional_domain"         = aws_s3_bucket.s3_content_bucket.bucket_regional_domain_name
    "website_endpoint"        = aws_s3_bucket_website_configuration.s3_content_bucket_website_configuration.website_endpoint
    "s3_website_url"          = format("http://%s.%s", aws_s3_bucket.s3_content_bucket.id, aws_s3_bucket.s3_content_bucket.website_domain)
    "s3_regional_website_url" = format("http://%s.s3-website.us-east-1.amazonaws.com", aws_s3_bucket.s3_content_bucket.id)
  }
} 

output "www_subdomain_bucket_info" {
  description = "Map containing the content bucket's arn, id, regional domain, website endpoint, and s3 website url"
  value = {
    "arn" = aws_s3_bucket.s3_www_subdomain_bucket.arn
    "id" = aws_s3_bucket.s3_www_subdomain_bucket.id
    "regional_domain" = aws_s3_bucket.s3_www_subdomain_bucket.bucket_regional_domain_name
    "website_domain" = aws_s3_bucket.s3_www_subdomain_bucket.website_domain
    "website_endpoint" = aws_s3_bucket_website_configuration.s3_www_subdomain_bucket_website_configuration.website_endpoint
    "s3_url" = format("http://%s.%s", aws_s3_bucket.s3_www_subdomain_bucket.id, aws_s3_bucket.s3_www_subdomain_bucket.website_domain)
  }
} 


output "content_cloudfront_distribution_info" {
  description = "Map containing the content cloudfront distribution's arn, id, domain name, hosted zone id"
  value = {
    "arn"            = aws_cloudfront_distribution.content_cloudfront_distribution.arn
    "id"             = aws_cloudfront_distribution.content_cloudfront_distribution.id
    "domain_name"    = aws_cloudfront_distribution.content_cloudfront_distribution.domain_name
    "hosted_zone_id" = aws_cloudfront_distribution.content_cloudfront_distribution.hosted_zone_id
  }
}

output "route53_hosted_zone_info" {
  description = "Map containing the hosted zone's arn, zone_id, name_servers"
  value = {
    "arn"          = data.aws_route53_zone.hosted_zone.arn
    "zone_id"      = data.aws_route53_zone.hosted_zone.zone_id
    "name_servers" = data.aws_route53_zone.hosted_zone.name_servers
  }
}