

# Set up the Fenix user that can do SQL-calls from the Fenix-Cloud Run-Backend
# https://medium.com/google-cloud/managing-cloud-sql-resources-with-terraform-76cc044319e9
resource "google_sql_user" "fenix-user" {
  name     = var.Fenix-DB-User//"fenix-cloudrun-dbuser"
  instance = google_sql_database_instance.postgres_instance.name
  password = "changeme_aA1!"

  project = var.project_id
}


