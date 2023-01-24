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

module "regular_spoke_2_service_perimeter" {
  source         = "terraform-google-modules/vpc-service-controls/google//modules/regular_service_perimeter"
  policy         = module.access_context_manager_policy.policy_id
  perimeter_name = var.spoke_2_perimeter_name

  description           = "Perimeter shielding bigquery project"
  resources             = ["218900252212"] # Projects protected by the perimeter
  access_levels         = [module.access_level_members.name] # Additional policy on top of ingress/egress policies

  restricted_services = ["storage.googleapis.com"] # Services listed here will be blocked from ingressing/egressing the perimeter

  ingress_policies = [
    {
      "from" = {
        "sources" = {
          access_levels = ["*"] # Allow Access from everywhere
        },
        "identities" = var.spoke_2_bucket_identities # These identities will be allowed to ingress the perimiter on restricted services
      }
      "to" = {
        "resources" = [ # Specific resources on restricted services can be listed here
          "*"
        ]
        "operations" = {
          "storage.googleapis.com" = {
            "methods" = [ # Specific API methods that are allowed to ingress the perimeter
              # "google.storage.objects.get",
              # "google.storage.objects.list"
              "*"
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