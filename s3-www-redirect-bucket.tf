
resource "aws_s3_bucket" "s3_www_subdomain_bucket" {
  bucket        = local.www_subdomain
  tags          = var.tags
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "s3_www_subdomain_bucket_website_configuration" {
  bucket = aws_s3_bucket.s3_www_subdomain_bucket.bucket

  redirect_all_requests_to {
    host_name = var.domain_name
    protocol  = "http"
  }
}
