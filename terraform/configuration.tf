terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.53, < 5.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 3.53, < 5.0"
    }
  }
  backend "gcs" {
  }
  required_version = ">= 0.13"
}

provider "google" {
  project = var.project_id
}
