
# Used for storing shared data
# Used for storing TestCases, TestSuites
# Used for storing TestData
# Used for storing execution-data, TestCase-executions and TestSuite-Executions
resource "google_sql_database" "fenix-standard-database" {
  name     = "fenix-standard-database"
  instance = google_sql_database_instance.postgres_instance.name

  project = var.project_id

}

# Special database for special tests
# Used for storing shared data
# Used for storing TestCases, TestSuites
# Used for storing TestData
# Used for storing execution-data, TestCase-executions and TestSuite-Executions
resource "google_sql_database" "fenix-special-1-database" {
  name     = "fenix-special-database-1"
  instance = google_sql_database_instance.postgres_instance.name

  project = var.project_id

}