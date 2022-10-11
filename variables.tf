variable "index_document" {
  type        = string
  default     = "index.html"
  description = "Amazon S3 returns this index document when requests are made to the root domain or any of the subfolders"
}

variable "error_document" {
  type        = string
  default     = "404.html"
  description = "An absolute path to the document to return in case of a 4XX error"
}

variable "bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
}

variable "acm_certificate_arn" {
  description = "ARN for the ACM SSL certificate which matches the bucket name"
  type = string
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}

variable "versioning_state" {
  description = "The versioning state of the bucket. Valid values: Enabled, Suspended, or Disabled.  While the parameter supports Disabled, this value is only intended for creating or importing resources that correspond to unversioned S3 buckets. Updating the value from Enabled or Suspended to Disabled will result in errors as the AWS S3 API does not support returning buckets to an unversioned state."
  type        = string
  default     = "Disabled"
}

variable "advanced_config" {
  description = "Map containing static web-site hosting or redirect configuration."
  type        = map(any)
  default     = {}
}

variable "origin_request_managed_policy_name_to_id" {
  description = "AmazonCloudFront origin request managed policies; see https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-origin-request-policies.html"
  type        = map(any)
  default = {
    "UserAgentRefererHeaders"                     = "acba4595-bd28-49b8-b9fe-13317c0390fa"
    "CORS-CustomOrigin"                           = "59781a5b-3903-41f3-afcb-af62929ccde1"
    "CORS-S3Origin"                               = "88a5eaf4-2fd4-4709-b370-b4c650ea3fcf"
    "AllViewer"                                   = "216adef6-5c7f-47e4-b989-5492eafa07d3"
    "Elemental-MediaTailor-PersonalizedManifests" = "775133bc-15f2-49f9-abea-afb2e0bf67d2"
  }
}

variable "caching_managed_policy_name_to_id" {
  description = "AmazonCloudFront caching managed policies; see https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html"
  type        = map(any)
  default = {
    "CachingOptimized"                       = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    "CachingOptimizedForUncompressedObjects" = "b2884449-e4de-46a7-ac36-70bc7f1ddd6d"
    "CachingDisabled"                        = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    "Elemental-MediaPackage"                 = "08627262-05a9-4f76-9ded-b50ca2e3a84f"
    "Amplify"                                = "2e54312d-136d-493c-8eb9-b001f22f67d2"
  }
}