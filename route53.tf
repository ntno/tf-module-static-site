# resource "aws_route53_zone" "subdomain" {
#   name = local.complete_custom_inferno_app_subdomain
#   tags = merge(
#     local.global_tags,
#     {
#       "Name" = local.app_subdomain[var.env],
#     }
#   )
# }

# resource "aws_route53_record" "subdomain_name_servers" {
#   zone_id = data.terraform_remote_state.infra.outputs.dns_zones["main"].id
#   name    = aws_route53_zone.subdomain.name
#   type    = "NS"
#   ttl     = "30"
#   records = aws_route53_zone.subdomain.name_servers
# }

# resource "aws_route53_record" "cloudfront_alias" {
#   zone_id = aws_route53_zone.subdomain.zone_id
#   name    = aws_route53_zone.subdomain.name
#   type    = "A"

#   alias {
#     name                   = aws_cloudfront_distribution.cloudfront_heroku_distribution.domain_name
#     zone_id                = aws_cloudfront_distribution.cloudfront_heroku_distribution.hosted_zone_id
#     evaluate_target_health = false
#   }
# }

# data "aws_elastic_beanstalk_hosted_zone" "current" {}
