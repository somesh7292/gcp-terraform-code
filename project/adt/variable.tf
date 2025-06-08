variable "region" {
  description = "GCP region name"
  type        = string
}

variable "suffix" {
  description = "Suffix for the project name"
  type        = string
}

variable "billing_account" {
  description = "Id of associated billing account"
  type        = string
}

variable "project_initial_name" {
  description = "Initial project name"
}