/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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

module "regular_service_perimeter_1" {
  source         = "terraform-google-modules/vpc-service-controls/google//modules/regular_service_perimeter"
  policy         = module.access_context_manager_policy.policy_id
  perimeter_name = var.perimeter_name

  description   = "Perimeter shielding bigquery project"
  resources     = ["218900252212","297439725161"]
  access_levels = [module.access_level_members.name]

  restricted_services = ["bigquery.googleapis.com", "storage.googleapis.com"]

  ingress_policies = [
    {
      "from" = {
        "sources" = {
          access_levels = ["*"] # Allow Access from everywhere
        },
        "identities" = var.read_bucket_identities
      }
      "to" = {
        "resources" = [
          "*"
        ]
        "operations" = {
          "storage.googleapis.com" = {
            "methods" = [
              "google.storage.objects.get",
              "google.storage.objects.list"
            ]
          }
        }
      }
    },
  ]

  shared_resources = {
    all =  ["218900252212","297439725161"]
  }

  depends_on = [
    module.gcs_buckets
  ]
}


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