locals {
  domain_for_cloudfront_content_distribution = aws_s3_bucket_website_configuration.s3_content_bucket_website_configuration.website_endpoint
}

resource "aws_cloudfront_distribution" "content_cloudfront_distribution" {
  comment = format("distribute '%s' s3 bucket as https://%s", var.domain_name, var.domain_name)
  origin {
    domain_name = local.domain_for_cloudfront_content_distribution
    origin_id   = var.domain_name
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


  aliases         = [var.domain_name]
  tags            = var.tags
  enabled         = true
  is_ipv6_enabled = false


  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.domain_name
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
    acm_certificate_arn            = var.domain_acm_certificate_arn
  }
}