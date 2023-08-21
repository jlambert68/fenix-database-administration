# Creates SQL instance to be used for all Fenix Databases
resource "google_sql_database_instance" "postgres_instance" {
  name             = var.postgres_instance_name
  region           = var.region
  database_version = "POSTGRES_14"
  root_password    = "abcABC123!"
  project          = var.project_id

  settings {
    tier      = "db-f1-micro"
    disk_size = 10  # 10 GB is the smallest disk size
    ip_configuration {
      ipv4_enabled    = false
      private_network = "projects/${var.project_id}/global/networks/fenix-gcp-general-vpc"
    }
    password_validation_policy {
      min_length                  = 6
      #complexity                  = "COMPLEXITY_DEFAULT"
      reuse_interval              = 1
      disallow_username_substring = true
      enable_password_policy      = true
    }
    database_flags {
      name  = "password_encryption"
      value = "scram-sha-256" #"md5" #"scram-sha-256"
    }
    database_flags {
      name  = "cloudsql.iam_authentication"
      value = "on"
    }
  }
  deletion_protection = false # set to true to prevent destruction of the resource
  depends_on          = [
    google_project_service.sqladmin_api,
    #google_service_networking_connection.private_vpc_connection,
  ]
}

