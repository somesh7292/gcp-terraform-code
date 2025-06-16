output "terraform_account_email" {
  value = module.project.terraform_account_email
}

output "project_id" {
  value = module.project.project_id
}

output "project_number" {
  value = module.project.project_name
}

output "cloud_function_sa" {
  value = module.cloud_function.cloud_function_sa
}