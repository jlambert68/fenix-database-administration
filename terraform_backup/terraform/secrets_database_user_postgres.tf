


# [START cloudrun_service_cloudsql_dbpass_secret]

# Create dbpass secret
resource "google_secret_manager_secret" "secret_manager_postgres_dbpassword" {
  secret_id = var.secret_manager_postgres_dbpassword_id
  project = var.project_id
  replication {
    #automatic = true
    user_managed {
      replicas {
        location = var.region
      }
    }
  }
  depends_on = [google_project_service.secretmanager_api]
}

# Attaches secret data for dbpass secret
resource "google_secret_manager_secret_version" "secrtet_data_postgres_dbpassword" {
  secret      = google_secret_manager_secret.secret_manager_postgres_dbpassword.id
  secret_data = google_sql_database_instance.postgres_instance.root_password # Stores secret as a plain txt in state
}

# Update service account for dbpass secret
resource "google_secret_manager_secret_iam_member" "secret_iam_member_postgres_dbpassword_1" {
  secret_id = google_secret_manager_secret.secret_manager_postgres_dbpassword.id
  role      = "roles/secretmanager.secretVersionAdder"
  member    = "serviceAccount:${google_service_account.cloudrun_service_account_fenix_backend.email}" # Project's compute service account
}

resource "google_secret_manager_secret_iam_member" "secret_iam_member_postgres_dbpassword_2" {
  secret_id = google_secret_manager_secret.secret_manager_postgres_dbpassword.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.cloudrun_service_account_fenix_backend.email}" # Project's compute service account
}

