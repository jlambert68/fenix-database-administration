package DataBaseMigration

import (
	"embed"
	"fenix-database-administration/src/SharedCode"
	_ "github.com/golang-migrate/migrate/v4/database/postgres"
)

//go:embed migration_sql/FenixDatabase/*.sql
var fenixDatabase embed.FS

const sqlPath = "migration_sql/FenixDatabase"

// MigrateFenixDatabase migrate the complete Fenix Database
func MigrateFenixDatabase(targetDatabase string) {

	migrateDatabase(targetDatabase,
		&fenixDatabase,
		SharedCode.TargetMigrationStepNumberInDevEnvironment,
		SharedCode.TargetMigrationStepNumberInAccEnvironment,
		sqlPath,
		SharedCode.DBNameFenixDatabasesSchemaFenixDomainAdministration,
		SharedCode.ForceTargetMigrationStepNumberInDevEnvironment,
		SharedCode.ForceTargetMigrationStepNumberInAccEnvironment,
		SharedCode.DropDatabaseInDevEnvironment,
		SharedCode.DropDatabaseInAccEnvironment,
		SharedCode.RelativeStepNumbersToMigrateInDevEnvironment,
		SharedCode.RelativeStepNumbersToMigrateInAccEnvironment,
		SharedCode.UseTargetStepOrReleativeStepsToMigrateInDevEnvironment,
		SharedCode.UseTargetStepOrReleativeStepsToMigrateInAccEnvironment)
}
