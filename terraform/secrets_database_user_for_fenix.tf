


# ****************************** START Fenix DB-User *******************************


# https://medium.com/google-cloud/managing-cloud-sql-resources-with-terraform-76cc044319e9


# [START cloudrun_service_cloudsql_dbpass_secret]

# Create fenix_dbuser_dbpass secret
resource "google_secret_manager_secret" "secret_manager_fenix_dbuser_dbpassword" {
  secret_id = var.secret_manager_fenix_dbuser_dbpassword_id
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

# Attaches secret data for fenix_dbuser_dbpass secret
resource "google_secret_manager_secret_version" "secrtet_data_fenix_debuser_dbpassword" {
  secret      = google_secret_manager_secret.secret_manager_fenix_dbuser_dbpassword.id
  secret_data = "changeme_aA1!" # Stores secret as a plain txt in state
}

# Update service account for fenix_dbuser_dbpass secret
resource "google_secret_manager_secret_iam_member" "secret_iam_member_fenix_dbuser_dbpassword_1" {
  secret_id = google_secret_manager_secret.secret_manager_fenix_dbuser_dbpassword.id
  role      = "roles/secretmanager.secretVersionAdder" //.secretAccessor"
  member    = "serviceAccount:${google_service_account.cloudrun_service_account_fenix_backend.email}" # Project's compute service account
}

resource "google_secret_manager_secret_iam_member" "secret_iam_member_fenix_dbuser_dbpassword_2" {
  secret_id = google_secret_manager_secret.secret_manager_fenix_dbuser_dbpassword.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.cloudrun_service_account_fenix_backend.email}" # Project's compute service account
}

# [END cloudrun_service_cloudsql_dbpass_secret]

# ****************************** END Fenix DB-User ****************************** *
/*
# Update service account for fenix_dbuser_dbpass secret
resource "google_secret_manager_secret_iam_member" "secret_iam_member_fenix_dbuser_dbpassword_1b" {
  secret_id = google_secret_manager_secret.secret_manager_fenix_dbuser_dbpassword.id
  role      = "roles/secretmanager.secretVersionAdder" //.secretAccessor"
  member    = "serviceAccount:${data.google_project.default.number}-compute@developer.gserviceaccount.com" # "serviceAccount:${google_service_account.cloudrun_service_account_fenix_backend.email}" # Project's compute service account
}

resource "google_secret_manager_secret_iam_member" "secret_iam_member_fenix_dbuser_dbpassword_2b" {
  secret_id = google_secret_manager_secret.secret_manager_fenix_dbuser_dbpassword.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${data.google_project.default.number}-compute@developer.gserviceaccount.com" # "serviceAccount:${google_service_account.cloudrun_service_account_fenix_backend.email}" # Project's compute service account
}
# Project data
data "google_project" "default" {
  project_id = var.project_id
}
*/
