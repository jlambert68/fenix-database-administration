resource "google_cloud_run_service" "default" {
  name     = "${var.app_name}"
  location = var.region
  project  = var.project_id

  template {
    spec {
      service_account_name = google_service_account.cloudrun_service_account_fenix_backend.email
      #service_account_name = "${data.google_project.default.number}-compute@developer.gserviceaccount.com"

      containers {
        image = "${var.GCR_PATH}:${var.IMAGE_TAG}"
        ports {
          container_port = var.GrpcServerPort
        }


        # Sets a environment variable for Execution Location
        env {
          name  = "ExecutionLocation"
          value = "GCP"
        }

        # Sets a environment variable for gRPC-servers port
        env {
          name  = "GrpcServerPort"
          value = var.GrpcServerPort
        }

        # Sets a environment variable for instance connection name
        env {
          name  = "DB_INSTANCE_CONNECTION_NAME"
          value = google_sql_database_instance.postgres_instance.connection_name
        }


        # Sets a environment variable for DB instance name
        env {
          name  = "DB_INSTANCE_NAME"
          value = var.postgres_instance_name
        }

        # Sets a environment variable for current execution environment
        env {
          name  = "ENVIRONMENT"
          value = var.ENVIRONMENT
        }

        # Sets a environment variable for current project
        env {
          name  = "PROJECT_ID"
          value = var.project_id
        }

        # Sets a environment variable for the name of the secret for Postgres DB-user
        env {
          name  = "SecretNameForPostgresDbPassword"
          value = google_secret_manager_secret.secret_manager_postgres_dbpassword.id
        }

        # Sets a environment variable for the name of the secret for Fenix-User DB-user
        env {
          name  = "SecretNameForFenixUserDbPassword"
          value = google_secret_manager_secret.secret_manager_fenix_dbuser_dbpassword.id
        }


        # Sets a environment variable that specifies to which step to migrate Database in  Development Environment
        env {
          name  = "TARGET_DB_MIGRATION_STEP_DEV_ENVIRONMENT"
          value = var.target_migrate_step_number_dev_environment
        }

        # Sets a environment variable that specifies to force the migrate to specific step for  Database in  Development Environment
        env {
          name  = "TARGET_DB_MIGRATION_STEP_DEV_ENVIRONMENT_FORCE"
          value = var.force_target_migrate_step_number_dev_environment
        }

        # Sets a environment variable that specifies relative steps to migrate in Development Environment
        env {
          name  = "RELATIVE_DB_MIGRATION_STEP_DEV_ENVIRONMENT"
          value = var.relative_migrate_step_number_dev_environment
        }

        # Sets a environment variable that specifies if relative steps or target step should be used during the migration in Development Environment
        env {
          name  = "USE_TARGET_OR_RELATIVE_STEP_DURING_DB_MIGRATION_DEV_ENVIRONMENT"
          value = var.use_target_step_or_relative_steps_dev_environment
        }

        # Sets a environment variable that specifies to drop everything in Database in Development Environment
        env {
          name  = "DROP_DATABASE_DEV_ENVIRONMENT"
          value = var.drop_everything_in_database_dev_environment
        }

        # Sets a environment variable that specifies to which step to migrate Database in Acceptance Environment
        env {
          name  = "TARGET_DB_MIGRATION_STEP_ACC_ENVIRONMENT"
          value = var.target_migrate_step_number_acc_environment
        }

        # Sets a environment variable that specifies to force the migrate to specific step for Database in  Acceptance Environment
        env {
          name  = "TARGET_DB_MIGRATION_STEP_ACC_ENVIRONMENT_FORCE"
          value = var.force_target_migrate_step_number_acc_environment
        }

        # Sets a environment variable that specifies relative steps to migrate in Acceptance Environment
        env {
          name  = "RELATIVE_DB_MIGRATION_STEP_ACC_ENVIRONMENT"
          value = var.relative_migrate_step_number_acc_environment
        }

        # Sets a environment variable that specifies if relative steps or target step should be used during the migration in Acceptance Environment
        env {
          name  = "USE_TARGET_OR_RELATIVE_STEP_DURING_DB_MIGRATION_ACC_ENVIRONMENT"
          value = var.use_target_step_or_relative_steps_acc_environment
        }

        # Sets a environment variable that specifies to drop everything in Database in Acceptance Environment
        env {
          name  = "DROP_DATABASE_ACC_ENVIRONMENT"
          value = var.drop_everything_in_database_acc_environment
        }

        # Sets a environment variable that specifies to drop everything in Database in Acceptance Environment
        env {
          name  = "UPDATE_PASSWORD_DEV_ENVIRONMENT"
          value = var.update_database_password_dev_environment
        }

        # Sets a environment variable that specifies to drop everything in Database in Acceptance Environment
        env {
          name  = "UPDATE_PASSWORD_ACC_ENVIRONMENT"
          value = var.update_database_password_acc_environment
        }

        /*

        # Sets a environment variable that specifies to which step to migrate 'FenixAdmin' SQL in  Development Environment
        env {
          name  = "FENIX_ADMIN_TARGET_DB_MIGRATION_STEP_DEV_ENVIRONMENT"
          value = var.target_migrate_step_number_fenix_admin_db_dev_environment
        }

        # Sets a environment variable that specifies to force the migrate to specific step for  'FenixAdmin' SQL in  Development Environment
        env {
          name  = "FENIX_ADMIN_TARGET_DB_MIGRATION_STEP_DEV_ENVIRONMENT_FORCE"
          value = var.force_target_migrate_step_number_fenix_admin_db_dev_environment
        }

        # Sets a environment variable that specifies to which step to migrate 'FenixAdmin' SQL in Acceptance Environment
        env {
          name  = "FENIX_ADMIN_TARGET_DB_MIGRATION_STEP_ACC_ENVIRONMENT"
          value = var.target_migrate_step_number_fenix_admin_db_acc_environment
        }

        # Sets a environment variable that specifies to force the migrate to specific step for  'FenixAdmin' SQL in  Acceptance Environment
        env {
          name  = "FENIX_ADMIN_TARGET_DB_MIGRATION_STEP_ACC_ENVIRONMENT_FORCE"
          value = var.force_target_migrate_step_number_fenix_admin_db_acc_environment
        }

        # Sets a environment variable that specifies to which step to migrate 'FenixBuilder' SQL in  Development Environment
        env {
          name  = "FENIX_BUILDER_TARGET_DB_MIGRATION_STEP_DEV_ENVIRONMENT"
          value = var.target_migrate_step_number_fenix_builder_db_dev_environment
        }

        # Sets a environment variable that specifies to force the migrate to specific step for  'FenixBuilder' SQL in  Development Environment
        env {
          name  = "FENIX_BUILDER_TARGET_DB_MIGRATION_STEP_DEV_ENVIRONMENT_FORCE"
          value = var.force_target_migrate_step_number_fenix_builder_db_dev_environment
        }

        # Sets a environment variable that specifies to which step to migrate 'FenixBuilder' SQL in Acceptance Environment
        env {
          name  = "FENIX_BUILDER_TARGET_DB_MIGRATION_STEP_ACC_ENVIRONMENT"
          value = var.target_migrate_step_number_fenix_builder_db_acc_environment
        }

        # Sets a environment variable that specifies to force the migrate to specific step for  'FenixBuilder' SQL in  Acceptance Environment
        env {
          name  = "FENIX_BUILDER_TARGET_DB_MIGRATION_STEP_ACC_ENVIRONMENT_FORCE"
          value = var.force_target_migrate_step_number_fenix_builder_db_acc_environment
        }
        */

      }
    }


    metadata {
      annotations = {
       # "run.googleapis.com/ingress"     = "all" //"internal-and-cloud-load-balancing"
        #"run.googleapis.com/launch-stage" = "BETA"
        #     In order to not trigger change:
        "run.googleapis.com/client-name" = "terraform"

        "run.googleapis.com/cloudsql-instances" = google_sql_database_instance.postgres_instance.connection_name

        # use the VPC Connector above
        "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.connector.name

        # all egress from the service should go through the VPC Connector
       "run.googleapis.com/vpc-access-egress" = "all"

      }
    }
  }

  autogenerate_revision_name = true
  depends_on                 = [google_project_service.secretmanager_api, google_project_service.cloudrun_api, google_project_service.sqladmin_api]
}
