output "name" {
  value = module.google_cloudfunctions2_function.name
}

output "secret_id" {
  value = module.secret_manager.secret_id
}

output "secret_version_id" {
  value = module.secret_manager.secret_version_id
}

output "google_compute_global_address" {
  value = google_compute_global_address.fn_ip.address
}