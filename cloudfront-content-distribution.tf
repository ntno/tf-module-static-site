locals {
  s3_origin_id = aws_s3_bucket.s3_content_bucket.bucket_regional_domain_name
  #format("%s.%s", aws_s3_bucket.s3_content_bucket.id, 
  #aws_s3_bucket_website_configuration.s3_content_bucket_website_configuration.website_domain
}

resource "aws_cloudfront_distribution" "content_cloudfront_distribution" {
  comment = format("distribute %s bucket as %s", var.bucket_name, var.domain_name)
  
  origin {
    domain_name = local.s3_origin_id
    origin_id   = local.s3_origin_id
  }

  aliases         = [var.domain_name]
  tags            = var.tags
  enabled         = true
  is_ipv6_enabled = false
  default_root_object = var.index_document

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id
    compress         = true

    viewer_protocol_policy = "redirect-to-https"
    
    cache_policy_id          = var.caching_managed_policy_name_to_id["CachingOptimized"]
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