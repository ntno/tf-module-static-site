# tf-module-static-site
creates AWS infrastructure for HTTPS static website

example usage:   

```
# update x.x.x to desired version
module "docs_site" {
  source = "git::https://github.com/ntno/tf-module-static-site?ref=x.x.x"
  index_document    = "index.html"
  error_document    = "404.html"
  versioning_state  = "Enabled"
  domain_name       = var.domain_name
  tags              = local.global_tags
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
https://github.com/terraform-aws-modules/terraform-aws-s3-bucket/