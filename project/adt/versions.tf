terraform {
  required_version = ">= 1.12.1"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.38.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.7.2"
    }
  }

  backend "gcs" {
  }
}
