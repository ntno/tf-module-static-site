# tf-module-static-site
creates AWS infrastructure for HTTPS static website.  compatible with [ntno/tf-module-static-site-cicd](https://github.com/ntno/tf-module-static-site-cicd).

for variable `domain_name` = "site.com" this module will create:  
- S3 bucket site.com (with static website config)
- S3 bucket www.site.com (with redirect to site.com static website config)
- cloudfront distribution for the site.com s3 bucket
- cloudfront distribution for the www.site.com s3 bucket
- route53 alias records pointing to the cloudfront distributions

## prerequisites
- register custom domain name for site  (site.com)
- request ACM certificate for site  (site.com)
- request ACM certificate for www subdomain  (*.site.com)
- verify ACM certificates by adding CNAME record to custom domain hosted zone (use console wizard for this)

## example usage:


```
# update x.x.x to desired version
module "docs_site" {
  source = "git::https://github.com/ntno/tf-module-static-site?ref=x.x.x"
  index_document                = "index.html"
  error_document                = "404.html"
  versioning_state              = "Enabled"
  domain_name                   = var.domain_name
  domain_acm_certificate_arn    = local.domain_to_cert_arn[var.domain_name]
  subdomain_acm_certificate_arn = local.domain_to_subdomain_cert_arn[var.domain_name]
  tags                = local.global_tags
  advanced_config = {
    routing_rules = [
      {
        condition = {
          key_prefix_equals = "docs/img/"
        },
        redirect = {
          replace_key_prefix_with = "img/"
        }
      }
    ]
  }
}

```

### see also
- [ntno/tf-module-static-site-cicd](https://github.com/ntno/tf-module-static-site-cicd)

### references
- https://github.com/terraform-aws-modules/terraform-aws-s3-bucket/  
- https://docs.aws.amazon.com/AmazonS3/latest/userguide/website-hosting-custom-domain-walkthrough.html  
