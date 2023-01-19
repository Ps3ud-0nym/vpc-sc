variable "policy_name" {
  description = "Policy Name"
  default     = ""
}
variable "access_level_name" {
  description = "Access Level Name"
  default     = ""
}
variable "access_level_members" {
  type        = list(string)
  description = "Access Level Members"
  default     = [""]
}
variable "regions" {
  type        = list(string)
  description = "Region"
  default     = [""]
}
variable "perimeter_name" {
  description = "Region"
  default     = ""
}
variable "read_bucket_identities" {
  type        = list(string)
  description = "Read Bucket Identities"
  default     = [""]
}
variable "buckets_prefix" {
  description = "Bucket Prefix"
  type        = string
  default     = "test-bucket"
}

variable "buckets_names" {
  description = "Buckets Names as list of strings"
  type        = list(string)
  default     = ["bucket1", "bucket2"]
}
variable "organization_id" {
  description = "OrgID"
  type        = string
  default     = ""
}
variable "bucket_project_id" {
  description = "Org ID"
  type        = string
  default     = ""
}