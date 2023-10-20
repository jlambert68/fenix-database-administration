package SharedCode

// Name in Database users
const DbUserName_postgres = "postgres"
const DbUserName_fenix_user = "fenix-cloudrun-dbuser"

// Names of databases
const DBNameFenixStandardDatabase = "fenix-standard-database"
const DBNameFenixSpecialDatabase1 = "fenix-special-database-1"

var DBNameToTarget string

// Names of Schemas used
const DBNameFenixDatabasesSchemaFenixDomainAdministration = "FenixDomainAdministration"
const DBNameFenixDatabasesSchemaFenixBuilder = "FenixBuilder"

// Path to the latest secret
const LatestSecretVersion = "/versions/latest"

// Path to the first secret
const FirstSecretVersion = "/versions/1"

// Path to database users secret password in Secret Manager
var SecretManagerPathForPostgresDbPassword string  //"projects/fenix-gcp-99r96-dev/secrets/postgres-dbpassword"
var SecretManagerPathForFenixUserDbPassword string //"projects/fenix-gcp-99r96-dev/secrets/fenix-dbuser-dbpass"

// Database databaseInstance ID.
//const DatabaseInstanceConnectionName = "postgres-instance-for-gprc-test-server"

// Unique ID for the application
var ApplicationRuntimeUuid string

// Definitions for where Cloud Run Service is running
type ExecutionLocationTypeType int

const (
	LocalhostNoDocker ExecutionLocationTypeType = iota
	LocalhostDocker
	GCP
)

// Definitions for in what environment Cloud Run Service is running
type ExecutionEnvironmentTypeType int

const (
	DEV ExecutionEnvironmentTypeType = iota
	ACC
)

// Definitions for the type for if the migration should use 'Target Step' or 'Relative Steps'
type UseTargetStepOrReleativeStepsType int

const (
	UseTargetStep UseTargetStepOrReleativeStepsType = iota
	UseRelativeSteps
)

var UseTargetStepOrReleativeStepsTypeMap = map[UseTargetStepOrReleativeStepsType]string{
	0: "UseTargetStep",
	1: "UseRelativeSteps",
}

// Environment variables
var (
	ExecutionLocation              ExecutionLocationTypeType
	ExecutionEnvironment           ExecutionEnvironmentTypeType
	ProjectId                      string
	DatabaseInstanceConnectionName string
	DatabaseInstanceName           string
	//FenixAdminTargetMigrationStepNumberInDevEnvironment        int
	//FenixAdminTargetMigrationStepNumberInAccEnvironment   int
	TargetMigrationStepNumberInDevEnvironment int
	TargetMigrationStepNumberInAccEnvironment int
	//FenixAdminForceTargetMigrationStepNumberInDevEnvironment bool
	//FenixAdminForceTargetMigrationStepNumberInAccEnvironment   bool
	ForceTargetMigrationStepNumberInDevEnvironment         bool
	ForceTargetMigrationStepNumberInAccEnvironment         bool
	DropDatabaseInDevEnvironment                           bool
	DropDatabaseInAccEnvironment                           bool
	RelativeStepNumbersToMigrateInDevEnvironment           int
	RelativeStepNumbersToMigrateInAccEnvironment           int
	UseTargetStepOrReleativeStepsToMigrateInDevEnvironment UseTargetStepOrReleativeStepsType
	UseTargetStepOrReleativeStepsToMigrateInAccEnvironment UseTargetStepOrReleativeStepsType
	UpdatePasswordInDevEnvironment                         bool
	UpdatePasswordInAccEnvironment                         bool

	DB_PASS_WhenRunLocally string
)
