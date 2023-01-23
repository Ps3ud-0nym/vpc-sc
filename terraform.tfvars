## GCP Project vars
project_id = "prj-hub-3"
project_name = "prj-hub-3"
primary_region = "europe-west2"
# billing_account_id = "" # Pass this in as an ENV var
producer_project_id = "prj-spoke-svpc-01"
billing_account_id = "018E2D-A0EC61-C2C865"
organization_id = "706581358019"


## VPC vars
vpc_name = "hub-svpc-01"
subnet_cidr_01 = "10.10.10.0/24"
subnet_cidr_02 = "10.10.20.0/22"

## PSC vars
service_attachment_name = "hub-service-attachment"
# producer_state_bucket = "" # Pass this in as an ENV var
producer_state_bucket_prefix = "terraform/spoke-1-state"
consumer_ip_address_name = "psc-ilb-consumer-address"
consumer_forwarding_rule_name = "psc-ilb-consumer-forwarding-rule"
private_zone_name = "psc-consumer-zone"
private_zone_dns_name = "consumer.psc."
private_zone_a_record = "endpoint"

## Bucket vars
bucket_project_id = "prj-hub-3"

## VPC SC vars
policy_name = "org-policy"
access_level_name = "BasicLevel"
access_level_members = ["user:alexander@candlemakerdirect.co.uk","serviceAccount:tf-service-account@prj-hub-3.iam.gserviceaccount.com"]
regions = ["GB"]

## Hub perimeter vars
hub_perimeter_name = "hub_perimeter"
hub_bucket_identities = ["user:alexander@candlemakerdirect.co.uk"]

## Spoke 1 perimeter vars
spoke_1_perimeter_name = "spoke_1_perimeter"
spoke_1_bucket_identities = ["user:alexander@candlemakerdirect.co.uk"]

## Spoke 2 perimeter vars
spoke_2_perimeter_name = "spoke_2_perimeter"
spoke_2_bucket_identities = ["user:alexander@candlemakerdirect.co.uk"]