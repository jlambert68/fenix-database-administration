variable "project_id" {
  type = string

}

variable "region" {
  description = "Location for load balancer and Cloud Run resources"
  default     = "europe-north1"
}

variable "app_name" {
  description = "Name for application and associated resources"
  default     = "fenix-database-administration"
}

variable "GCR_PATH" {
  description = "Path to where the container image is stored"

}

variable "IMAGE_TAG" {
  description = "The container image tag"

}

variable "ENVIRONMENT" {
  description = "The environment 'dev' or 'acc'"

}

variable "postgres_instance_name" {
  description = "The Postgres instance that have the different Fenix databases"
  default     = "fenix-databases"
}

variable "GrpcServerPort" {
  description = "The port used by gRPC and that is opened in Docker"
  default     = "6670"
}

variable "Postgres-DB-User" {
  description = "The Postgres Admin Databases User"
  default     = "postgres"
}

variable "Fenix-DB-User" {
  description = "The user used by Fenix backend to access the Databases"
  default     = "fenix-cloudrun-dbuser"
}

variable "secret_manager_postgres_dbpassword_id" {
description = "The id for the secret for Postgres Database Password"
default     = "postgres-dbuser-fenixbackend-dbpassword"
}

variable "secret_manager_fenix_dbuser_dbpassword_id" {
  description = "The id for the secret for Fenix-User Database Password"
  default     = "fenix-dbuser-fenixbackend-dbpassword"
}

variable "target_migrate_step_number_dev_environment" {
  description = "Migrate SQL in Development environment to this target Migration Step. '0' will do a Migrate.Down() and '6666' will do a Migrate.Up()"
  default = "6666"
}
variable "relative_migrate_step_number_dev_environment" {
  description = "Migrate SQL in Development environment this number of steps, up or down."
  default = "0"
}

variable "use_target_step_or_relative_steps_dev_environment" {
  description = "Should the migration use relative steps or use the target step as input. Allowed values are: 'UseTargetStep' or 'UseRelativeSteps'"
  default = "UseTargetStep"
}

variable "force_target_migrate_step_number_dev_environment" {
  description = "Force the Migrate SQL in Development environment to this target Migration Step"
  default = "false"
}

variable "drop_everything_in_database_dev_environment" {
  description = "Drop all objects in database for Development environment "
  default = "false"
}

variable "target_migrate_step_number_acc_environment" {
  description = "Migrate SQL in AcceptanceTest environment to this target Migration Step"
  default = "4"
}
variable "relative_migrate_step_number_acc_environment" {
  description = "Migrate SQL in Acceptance environment this number of steps, up or down."
  default = "0"
}

variable "use_target_step_or_relative_steps_acc_environment" {
  description = "Should the migration use relative steps or use the target step as input. Allowed values are: 'UseTargetStep' or 'UseRelativeSteps'"
  default = "UseTargetStep"
}

variable "force_target_migrate_step_number_acc_environment" {
  description = "Force the Migrate SQL in Development environment to this target Migration Step"
  default = "false"
}

variable "drop_everything_in_database_acc_environment" {
  description = "Drop all objects in database for Acceptance environment "
  default = "false"
}


variable "update_database_password_dev_environment" {
  description = "Should the database passwords be updated, in Development environment, when deployed"
  default = "false"
}

variable "update_database_password_acc_environment" {
  description = "Should the database passwords be updated, in Acceptance environment, when deployed"
  default = "false"
}

/*
variable "target_migrate_step_number_fenix_admin_db_dev_environment" {
  description = "Migrate SQL in Development environment for 'FenixAdmin' to this target Migration Step"
  default = "4"
}
variable "force_target_migrate_step_number_fenix_admin_db_dev_environment" {
  description = "Force the Migrate SQL in Development environment for 'FenixAdmin' to this target Migration Step"
  default = "false"
}

variable "target_migrate_step_number_fenix_admin_db_acc_environment" {
  description = "Migrate SQL in AcceptanceTest environment for 'FenixAdmin' to this target Migration Step"
  default = "4"
}
variable "force_target_migrate_step_number_fenix_admin_db_acc_environment" {
  description = "Force the Migrate SQL in Development environment for 'FenixAdmin' to this target Migration Step"
  default = "false"
}

variable "target_migrate_step_number_fenix_builder_db_dev_environment" {
  description = "Migrate SQL in Development environment for 'FenixBuilder' to this target Migration Step"
  default = "2"
}
variable "force_target_migrate_step_number_fenix_builder_db_dev_environment" {
  description = "Force the Migrate SQL in Development environment for 'FenixBuilder' to this target Migration Step"
  default = "false"
}

variable "target_migrate_step_number_fenix_builder_db_acc_environment" {
  description = "Migrate SQL in AcceptanceTest environment for 'FenixBuilder' to this target Migration Step"
  default = "-1"
}
variable "force_target_migrate_step_number_fenix_builder_db_acc_environment" {
  description = "Force the Migrate SQL in AcceptanceTest environment for 'FenixBuilder' to this target Migration Step"
  default = "false"
}
*/

