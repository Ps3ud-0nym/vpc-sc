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
variable "hub_perimeter_name" {
  description = "Hub Perimeter Name"
  default     = ""
}
variable "hub_bucket_identities" {
  type        = list(string)
  description = "Hub Bucket Identities"
  default     = [""]
}
variable "spoke_1_perimeter_name" {
  description = "Spoke 1 Perimeter Name"
  default     = ""
}
variable "spoke_1_bucket_identities" {
  type        = list(string)
  description = "Spoke 1 Bucket Identities"
  default     = [""]
}
variable "spoke_2_perimeter_name" {
  description = "Spoke 2 Perimeter Name"
  default     = ""
}
variable "spoke_2_bucket_identities" {
  type        = list(string)
  description = "Spoke 2 Bucket Identities"
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