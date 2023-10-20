
# Enable Secret Manager API
resource "google_project_service" "secretmanager_api" {
  service            = "secretmanager.googleapis.com"
  disable_on_destroy = false
  project = var.project_id
}

# Enable SQL Admin API
resource "google_project_service" "sqladmin_api" {
  service            = "sqladmin.googleapis.com"
  disable_on_destroy = false
  project = var.project_id
}

# Enable Cloud Run API
resource "google_project_service" "cloudrun_api" {
  service            = "run.googleapis.com"
  disable_on_destroy = false
  project = var.project_id
}

# Enable FireStore API
resource "google_project_service" "firestore_api" {
  project = var.project_id
  service = "firestore.googleapis.com"

#  disable_dependent_services = false  # Optional. Set to true if you want to disable dependent services.
  disable_on_destroy         = false  # Optional. Set to true if you want to disable the service during destroy.
}
