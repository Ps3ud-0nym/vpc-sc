module "gcs_buckets" {
  source           = "terraform-google-modules/cloud-storage/google"
  version          = "~> 3.4"
  project_id       = var.bucket_project_id
  names            = var.buckets_names
  randomize_suffix = true
  prefix           = var.buckets_prefix
  set_admin_roles  = true
  admins           = ["allUsers"]
}