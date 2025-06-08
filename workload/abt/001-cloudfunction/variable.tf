variable "project_id" {
  description = "Project id"
  type = string
}

variable "function_zip_path" {
  description = "Path of zip file for cloud function"
  type = string
}

variable "location" {
  description = "default location"
  type = string
}

variable "location_backup" {
  description = "Backup location"
  type = string
}

variable "description" {
  description = "Description of the cloud function"
}

variable "function_name" {
  description = "Name of the function"
  type = string
}

variable "runtime" {
  description = "Runtime of cloud function"
  type = string
}

variable "entry_point" {
  description = "Entry point of cloud function"
  type = string
}

variable "max_instance_count" {
  description = "Maximum cloud function instance count"
  type = number
}

variable "available_memory" {
  description = "Available memory for cloud function"
  type = string
}

variable "timeout_seconds" {
  description = "Timeout for cloud function"
  type = string
}

variable "ingress_settings" {
  description = "Ingress setting for cloud function"
  type = string
}

variable "key" {
  description = "Name of the environment variable."
  type = string
}

variable "secret_id" {
  description = "Name of the secret in secret manager"
  type = string
}

variable "api_key" {
  description = "Api key to be stored in secret manager"
  type = string
  sensitive = true
}

variable "backend_service_name" {
  description = "Backend service name"
  type = string
}

variable "network_endpoint_name" {
  description = "Network endpoint name"
  type = string
}

variable "load_balancing_scheme" {
  description = "load balancing scheme"
  type = string
}

variable "protocol" {
  description = "Protocol for loadbalancer"
  type = string
}

variable "port_name" {
  description = "Port name to be used"
  type = string
}

variable "timeout_sec" {
  description = "Timeout for the load balancer"
  type = string
}

variable "enable_cdn" {
  description = "Flag to Enable cdn"
  type = bool
}

variable "network_endpoint_type" {
  description = "Network endpoint type"
  type = string
}

variable "email_address" {
  description = "Email address for alerts"
  type = string
}