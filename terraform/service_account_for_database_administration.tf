resource "google_service_account" "cloudrun_service_account_fenix_backend" {
  account_id   = "fenix-backend-service-account"
  display_name = "Cloud Run Service Account for Fenix Database Administration"

  project = var.project_id
}

resource "google_project_iam_member" "cloudrun_service_account_role" {
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.cloudrun_service_account_fenix_backend.email}"

 project = var.project_id

}

resource "google_project_iam_member" "iam_user_secretmanager_versions_manager" {
  role   = "roles/secretmanager.secretVersionManager"
  member  = "serviceAccount:${google_service_account.cloudrun_service_account_fenix_backend.email}"

  project = var.project_id
}


resource "google_project_iam_member" "iam_user_cloudsql_admin" {
  role   = "roles/cloudsql.admin"
  member  = "serviceAccount:${google_service_account.cloudrun_service_account_fenix_backend.email}"

  project = var.project_id
}


