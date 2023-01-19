# module "enabled_google_apis" {
  
#   # depends_on = [
#   #   module.project_factory
#   # ]
  
#   source  = "terraform-google-modules/project-factory/google//modules/project_services"
#   version = "~> 11.3"

#   project_id                  = var.project_id
#   disable_services_on_destroy = false

#   activate_apis = [
#     "accesscontextmanager.googleapis.com",
#   ]
# }

