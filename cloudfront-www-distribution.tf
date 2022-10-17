locals {
  subdomain_for_cloudfront_content_distribution = aws_s3_bucket_website_configuration.s3_www_subdomain_bucket_website_configuration.website_endpoint
}

resource "aws_cloudfront_distribution" "www_subdomain_cloudfront_distribution" {
  comment = format("distribute '%s' s3 bucket as https://%s", local.www_subdomain, local.www_subdomain)
  origin {
    domain_name = local.subdomain_for_cloudfront_content_distribution
    origin_id   = local.www_subdomain
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols = [
        "TLSv1",
        "TLSv1.1",
        "TLSv1.2",
      ]
    }
  }


  aliases         = [local.www_subdomain]
  tags            = var.tags
  enabled         = true
  is_ipv6_enabled = false


  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.www_subdomain
    compress         = true

    viewer_protocol_policy = "redirect-to-https"

    cache_policy_id = var.caching_managed_policy_name_to_id["CachingOptimized"]
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
    acm_certificate_arn            = var.subdomain_acm_certificate_arn
  }
}