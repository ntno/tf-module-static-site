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

variable "enable_versioning" {
  description = "Object versioning flag."
  type        = bool
  default     = true
}

variable "known_ips" {
  description = "List of IPs to allow access"
  type        = list(string)
  default     = []
}

variable "advanced_config" {
  description = "Map containing static web-site hosting or redirect configuration."
  type        = map
  default     = {}
}
