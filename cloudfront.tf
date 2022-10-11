resource "aws_cloudfront_distribution" "cloudfront_distribution" {
  origin {
    domain_name = var.domain_name
    origin_id   = aws_s3_bucket_website_configuration.s3_bucket_website_configuration.website_domain
    custom_origin_config {
      http_port                = 80
      https_port               = 443
      origin_keepalive_timeout = 5
      origin_protocol_policy   = "match-viewer"
      origin_read_timeout      = 30
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
    target_origin_id = aws_s3_bucket_website_configuration.s3_bucket_website_configuration.website_domain
    compress         = true

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0

    cache_policy_id          = var.caching_managed_policy_name_to_id["CachingOptimizeds"]
    origin_request_policy_id = var.origin_request_managed_policy_name_to_id["AllViewer"]
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
    acm_certificate_arn            = var.acm_certificate_arn
  }
}