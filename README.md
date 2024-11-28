MIT License

Copyright (c) 2024 Jonas Lambert

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

***

# Fenix Inception

## Database Administration
Fenix Database Administration is used for handling setup of the full database needed. It uses a support library called "Migrate" (https://github.com/golang-migrate/migrate) that handles changes and updates to the database. 

By using this library the database is always set up in the same way every time a new instance should be deployd

The following environment variables is needed for Fenix Database Administration to be able to run locally.

| Environment variable                                            | Example value         | comment                                                                                                                                                     |
|-----------------------------------------------------------------|-----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DB_HOST                                                         | 127.0.0.1             |                                                                                                                                                             |
| DB_INSTANCE_CONNECTION_NAME                                     | not used              | not used                                                                                                                                                    |
| DB_INSTANCE_NAME                                                | fenix-databases       |                                                                                                                                                             |
| DB_NAME                                                         | fenix_gcp_database_v3 |                                                                                                                                                             |
| DB_PASS                                                         | <database password>   |                                                                                                                                                             |
| DB_PORT                                                         | 5432                  |                                                                                                                                                             |
| DB_USER                                                         | postgres              |                                                                                                                                                             |
| DROP_DATABASE_ACC_ENVIRONMENT                                   | false                 | Drop all objects in database for Acceptance environment. When setting to true, the database will be cleared and a fresh set up can be performed afterwards  |
| DROP_DATABASE_DEV_ENVIRONMENT                                   | false                 | Drop all objects in database for Development environment. When setting to true, the database will be cleared and a fresh set up can be performed afterwards |
| ENVIRONMENT                                                     | dev                   | Used when running in GCP                                                                                                                                    |
| ExecutionLocation                                               | LOCALHOST_NODOCKER    |                                                                                                                                                             |
| FenixUserDbPassword                                             | Not used              | Not used                                                                                                                                                    |
| GrpcServerPort                                                  | 6670                  |                                                                                                                                                             |
| PostgresDbPassword                                              | Not used              | Not used                                                                                                                                                    |
| PROJECT_ID                                                      | mycloud-run-project   |                                                                                                                                                             |
| RELATIVE_DB_MIGRATION_STEP_ACC_ENVIRONMENT                      | 0                     | Migrate SQL in Acceptance environment this number of steps, up or down.                                                                                     |
| RELATIVE_DB_MIGRATION_STEP_DEV_ENVIRONMENT                      | 0                     | Migrate SQL in Development environment this number of steps, up or down.                                                                                    |
| SecretNameForFenixUserDbPassword                                | Not used              | Not used                                                                                                                                                    |
| SecretNameForPostgresDbPassword                                 | Not used              | Not used                                                                                                                                                    |
| TARGET_DB_MIGRATION_STEP_ACC_ENVIRONMENT                        | 4                     | Migrate SQL in Acceptance environment to this target Migration Step. '0' will do a Migrate.Down() and '6666' will do a Migrate.Up()                         |
| TARGET_DB_MIGRATION_STEP_ACC_ENVIRONMENT_FORCE                  | false                 | Force the Migrate SQL in Acceptance environment to this target Migration Step                                                                               |
| TARGET_DB_MIGRATION_STEP_DEV_ENVIRONMENT                        | 6666                  | Migrate SQL in Development environment to this target Migration Step. '0' will do a Migrate.Down() and '6666' will do a Migrate.Up()                        |
| TARGET_DB_MIGRATION_STEP_DEV_ENVIRONMENT_FORCE                  | false                 | Force the Migrate SQL in Development environment to this target Migration Step                                                                              |
| UPDATE_PASSWORD_ACC_ENVIRONMENT                                 | false                 | Not used                                                                                                                                                    |
| UPDATE_PASSWORD_DEV_ENVIRONMENT                                 | false                 | Not used                                                                                                                                                    |
| USE_TARGET_OR_RELATIVE_STEP_DURING_DB_MIGRATION_ACC_ENVIRONMENT | UseTargetStep         | "Should the migration use relative steps or use the target step as input. Allowed values are: 'UseTargetStep' or 'UseRelativeSteps'                         |
| USE_TARGET_OR_RELATIVE_STEP_DURING_DB_MIGRATION_DEV_ENVIRONMENT | UseTargetStep         | "Should the migration use relative steps or use the target step as input. Allowed values are: 'UseTargetStep' or 'UseRelativeSteps'                         |

## Cloud SQL Proxy
To be able to connect to the database in GCP, when running locally, you need to run Cloud SQL Proxy from Google.

Start it using the following example structure: "./cloud-sql-proxy mycloud-run-project:europe-north1:fenix-sqlserver" 
