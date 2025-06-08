
resource "google_compute_region_network_endpoint_group" "function_neg" {
  name                  = var.network_endpoint_name
  region                = var.location
  network_endpoint_type = var.network_endpoint_type
  project = var.project_id
  cloud_function {
    function = module.google_cloudfunctions2_function.name
  }
}

resource "google_compute_region_network_endpoint_group" "function_neg_backup" {
  name                  = "${var.network_endpoint_name}-backup"
  region                = var.location_backup
  network_endpoint_type = var.network_endpoint_type
  project = var.project_id
  cloud_function {
    function = module.google_cloudfunctions2_function_backup.name
  }
}

resource "google_compute_backend_service" "fn_backend" {
  name                            = "backend-function-v2"
  project = var.project_id
  load_balancing_scheme           = var.load_balancing_scheme
  protocol                        = var.protocol
  port_name                       = var.port_name
  timeout_sec                     = var.timeout_sec
  enable_cdn                      = var.enable_cdn
  connection_draining_timeout_sec = 0
  backend {
    group = google_compute_region_network_endpoint_group.function_neg.id
  }
  backend {
    group = google_compute_region_network_endpoint_group.function_neg_backup.id
  }
}

resource "google_compute_url_map" "fn_url_map" {
  name            = "function-v2-map"
  project = var.project_id
  default_service = google_compute_backend_service.fn_backend.id
}

resource "google_compute_target_http_proxy" "fn_proxy" {
  name    = "function-v2-http-proxy"
  project = var.project_id
  url_map = google_compute_url_map.fn_url_map.id
}

resource "google_compute_global_address" "fn_ip" {
  name = "function-v2-global-ip"
  project = var.project_id
}

resource "google_compute_global_forwarding_rule" "fn_forwarding_rule" {
  name       = "function-v2-fw-rule"
  project = var.project_id
  target     = google_compute_target_http_proxy.fn_proxy.id
  port_range = "80"
  ip_address = google_compute_global_address.fn_ip.address
}