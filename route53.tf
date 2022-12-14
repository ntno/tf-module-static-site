data "aws_route53_zone" "hosted_zone" {
  name = format("%s.", var.domain_name)
}

resource "aws_route53_record" "domain_to_cloudfront_distribution" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.content_cloudfront_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.content_cloudfront_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_subdomain_to_cloudfront_distribution" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = "www."
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.www_subdomain_cloudfront_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.www_subdomain_cloudfront_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
