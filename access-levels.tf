locals {
  parent_id    = var.organization_id
}

module "access_context_manager_policy" {
  source      = "terraform-google-modules/vpc-service-controls/google"
  parent_id   = local.parent_id
  policy_name = var.policy_name
}

module "access_level_members" {
  source               = "terraform-google-modules/vpc-service-controls/google//modules/access_level"
  description          = "Simple Example Access Level"
  policy               = module.access_context_manager_policy.policy_id
  name                 = var.access_level_name
  members              = var.access_level_members
  regions              = var.regions
}

resource "null_resource" "wait_for_members" {
  provisioner "local-exec" {
    command = "sleep 60"
  }

  depends_on = [module.access_level_members]
}