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

module "regular_spoke_1_service_perimeter" {
  source         = "terraform-google-modules/vpc-service-controls/google//modules/regular_service_perimeter"
  policy         = module.access_context_manager_policy.policy_id
  perimeter_name = var.spoke_1_perimeter_name

  description           = "Perimeter shielding bigquery project"
  resources             = ["297439725161"]
  access_levels         = [module.access_level_members.name]

  restricted_services_dry_run = ["bigquery.googleapis.com", "storage.googleapis.com"]

  ingress_policies_dry_run = [
    {
      "from" = {
        "sources" = {
          access_levels = ["*"] # Allow Access from everywhere
        },
        "identities" = var.spoke_1_bucket_identities
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