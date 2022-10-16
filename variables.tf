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
