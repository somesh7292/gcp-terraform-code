module "project" {
  source               = "git::https://github.com/somesh7292/gcp-terraform-module.git//project?ref=project/1.0.0"
  project_initial_name = "adt-test-${var.suffix}"
  billing_account      = var.billing_account
}

module "cloud_function" {
  source = "git::https://github.com/somesh7292/gcp-terraform-module.git//project-cloud-function?ref=project-cloud-function/1.0.0"
  project_id = module.project.project_id
}

module "secret_manager" {
  source = "git::https://github.com/somesh7292/gcp-terraform-module.git//project-secret-manager?ref=project-secret-manager/1.0.0"
  project_id = module.project.project_id
}