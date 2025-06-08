locals {
  hash_api_key          = sha256(var.api_key)
}

module "secret_manager" {
    source = "git::https://github.com/somesh7292/gcp-terraform-module.git//secret-manager?ref=secret-manager/1.0.0"
    project_id = var.project_id
    region = var.location
    secret_id = var.secret_id
    secret_data = var.api_key
}

module "google_cloudfunctions2_function" {
  source = "git::https://github.com/somesh7292/gcp-terraform-module.git//cloudfunction?ref=cloudfunction/1.0.0"
  project_id = var.project_id
  location = var.location
  function_zip_path = var.function_zip_path
  function_name = var.function_name
  description = var.description
  runtime = var.runtime
  entry_point = var.entry_point
  max_instance_count = var.max_instance_count
  timeout_seconds = var.timeout_seconds
  ingress_settings = var.ingress_settings
  available_memory = var.available_memory
  secret_id = var.secret_id
  key = var.key
  secret_key_trigger = local.hash_api_key
}

module "google_cloudfunctions2_function_backup" {
  source = "git::https://github.com/somesh7292/gcp-terraform-module.git//cloudfunction?ref=cloudfunction/1.0.0"
  project_id = var.project_id
  location = var.location_backup
  function_zip_path = var.function_zip_path
  function_name = var.function_name
  description = var.description
  runtime = var.runtime
  entry_point = var.entry_point
  max_instance_count = var.max_instance_count
  timeout_seconds = var.timeout_seconds
  ingress_settings = var.ingress_settings
  available_memory = var.available_memory
  secret_id = var.secret_id
  key = var.key
  secret_key_trigger = local.hash_api_key
}