# tf-module-static-site
- creates AWS infrastructure for HTTPS static website
- bucket name should include top level domain (.net, .com, etc.)
- bucket name should NOT include www subdomain 

example usage:   

```
module "docs_site" {
  source = "git::https://github.com/ntno/tf-module-static-site?ref=0.0.0"
  index_document    = "index.html"
  error_document    = "404.html"
  versioning_state  = "Enabled"
  bucket_name       = var.bucket_name
  known_ips         = var.known_ips
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