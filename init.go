package fenix_database_administration

import (
	"fenix-database-administration/SharedCode"
	"fenix-database-administration/gRPC"
	"fmt"
	uuidGenerator "github.com/google/uuid"
	"log"
	"os"
	"strconv"
)

// mustGetEnv is a helper function for getting environment variables.
// Displays a warning if the environment variable is not set.
func mustGetenv(k string) string {
	v := os.Getenv(k)
	if v == "" {
		log.Fatalf("Warning: %s environment variable not set.\n", k)
	}
	return v
}

func init() {

	var err error

	// Create Unique Uuid for run time instance
	SharedCode.ApplicationRuntimeUuid = uuidGenerator.New().String()
	fmt.Println("ApplicationRuntimeUuid: " + SharedCode.ApplicationRuntimeUuid)

	// Get Environment variable to tell were gRPC-Server is running
	var environmentVariableExecutionLocation = mustGetenv("ExecutionLocation")

	switch environmentVariableExecutionLocation {
	case "LOCALHOST_NODOCKER":
		SharedCode.ExecutionLocation = SharedCode.LocalhostNoDocker

	case "LOCALHOST_DOCKER":
		SharedCode.ExecutionLocation = SharedCode.LocalhostDocker

	case "GCP":
		SharedCode.ExecutionLocation = SharedCode.GCP

	default:
		fmt.Println("Unknown Execution location : " + environmentVariableExecutionLocation + ". Expected one of the following: 'LOCALHOST_NODOCKER', 'LOCALHOST_DOCKER', 'GCP'")
		os.Exit(0)
	}
	fmt.Println("ExecutionLocation: " + string(SharedCode.ExecutionLocation))

	// Port for gRPC-Server
	_, err = strconv.Atoi(mustGetenv("GrpcServerPort"))
	if err != nil {
		fmt.Println("Couldn't convert environment variable 'GrpcServerPort' to an integer, error: ", err)
		os.Exit(0)
	}

	// We now know that port is an integer
	gRPCServer.GRPCServerPort = mustGetenv("GrpcServerPort")
	fmt.Println("GrpcServerPort: " + gRPCServer.GRPCServerPort)

	// Get ENVIRONMENT variable to tell in gRPC-Server environment it is running
	var environmentVariableExecutionEnvironment = mustGetenv("ENVIRONMENT")

	switch environmentVariableExecutionEnvironment {
	case "dev":
		SharedCode.ExecutionEnvironment = SharedCode.DEV

	case "acc":
		SharedCode.ExecutionEnvironment = SharedCode.ACC

	default:
		fmt.Println("Unknown ENVIRONMENT: " + environmentVariableExecutionEnvironment + ". Expected one of the following: 'dev', 'acc'")
		os.Exit(0)
	}
	fmt.Println("ExecutionEnvironment: " + string(SharedCode.ExecutionEnvironment))

	// Get environment variable for the name of the secret for Postgres DB-user
	SharedCode.SecretManagerPathForPostgresDbPassword = mustGetenv("SecretNameForPostgresDbPassword")
	fmt.Println("SecretManagerPathForPostgresDbPassword: " + SharedCode.SecretManagerPathForPostgresDbPassword)

	// Get environment variable for the name of the secret for Fenix-User DB-user
	SharedCode.SecretManagerPathForFenixUserDbPassword = mustGetenv("SecretNameForFenixUserDbPassword")
	fmt.Println("SecretManagerPathForFenixUserDbPassword: " + SharedCode.SecretManagerPathForFenixUserDbPassword)

	// Get environment variable for the Database Instance Connection Name
	SharedCode.DatabaseInstanceConnectionName = mustGetenv("DB_INSTANCE_CONNECTION_NAME")
	fmt.Println("DatabaseInstanceConnectionName: " + SharedCode.DatabaseInstanceConnectionName)

	// Get environment variable for the Database Instance Name
	SharedCode.DatabaseInstanceName = mustGetenv("DB_INSTANCE_NAME")
	fmt.Println("DatabaseInstanceConnectionName: " + SharedCode.DatabaseInstanceName)

	// Get environment variable for the Project-Id
	SharedCode.ProjectId = mustGetenv("PROJECT_ID")
	fmt.Println("ProjectId: " + SharedCode.ProjectId)

	// **** Target Step Number for Dev-environment ****
	// Database migration step for development environment
	var tempTargetMigrationStepNumberInDevEnvironment int
	tempTargetMigrationStepNumberInDevEnvironment, err = strconv.Atoi(mustGetenv("TARGET_DB_MIGRATION_STEP_DEV_ENVIRONMENT"))
	if err != nil {
		fmt.Println("Couldn't convert environment variable 'TARGET_DB_MIGRATION_STEP_DEV_ENVIRONMENT' to an integer, error: ", err)
		os.Exit(0)
	}

	// We now know that value is an integer
	SharedCode.TargetMigrationStepNumberInDevEnvironment = tempTargetMigrationStepNumberInDevEnvironment
	fmt.Println("TARGET_DB_MIGRATION_STEP_DEV_ENVIRONMENT: " + strconv.Itoa(SharedCode.TargetMigrationStepNumberInDevEnvironment))

	// **** Target Step Number for Acc-environment ****
	// Database migration step for Acc environment
	var tempTargetMigrationStepNumberInAccEnvironment int
	tempTargetMigrationStepNumberInAccEnvironment, err = strconv.Atoi(mustGetenv("TARGET_DB_MIGRATION_STEP_ACC_ENVIRONMENT"))
	if err != nil {
		fmt.Println("Couldn't convert environment variable 'TARGET_DB_MIGRATION_STEP_ACC_ENVIRONMENT' to an integer, error: ", err)
		os.Exit(0)
	}

	// We now know that value is an integer
	SharedCode.TargetMigrationStepNumberInAccEnvironment = tempTargetMigrationStepNumberInAccEnvironment
	fmt.Println("TARGET_DB_MIGRATION_STEP_ACC_ENVIRONMENT: " + strconv.Itoa(SharedCode.TargetMigrationStepNumberInAccEnvironment))

	// **** Force-flag for Step Number for Dev-environment ****
	tempForceFlag, err := strconv.ParseBool(mustGetenv("TARGET_DB_MIGRATION_STEP_DEV_ENVIRONMENT_FORCE"))
	if err != nil {
		fmt.Println("Couldn't convert environment variable 'TARGET_DB_MIGRATION_STEP_DEV_ENVIRONMENT_FORCE' to a boolean, error: ", err)
		os.Exit(0)
	}

	// Set the Force Flag
	SharedCode.ForceTargetMigrationStepNumberInDevEnvironment = tempForceFlag
	fmt.Printf("TARGET_DB_MIGRATION_STEP_DEV_ENVIRONMENT_FORCE value: %v\n", tempForceFlag)

	// **** Force-flag for Step Number for Acc-environment ****
	tempForceFlag, err = strconv.ParseBool(mustGetenv("TARGET_DB_MIGRATION_STEP_ACC_ENVIRONMENT_FORCE"))
	if err != nil {
		fmt.Println("Couldn't convert environment variable 'TARGET_DB_MIGRATION_STEP_ACC_ENVIRONMENT_FORCE' to a boolean, error: ", err)
		os.Exit(0)
	}

	// Set the Force Flag
	SharedCode.ForceTargetMigrationStepNumberInAccEnvironment = tempForceFlag
	fmt.Printf("TARGET_DB_MIGRATION_STEP_ACC_ENVIRONMENT_FORCE value: %v\n", tempForceFlag)

	// **** Drop stuff in database-flag for Dev-environment ****
	tempDropFlag, err := strconv.ParseBool(mustGetenv("DROP_DATABASE_DEV_ENVIRONMENT"))
	if err != nil {
		fmt.Println("Couldn't convert environment variable 'DROP_DATABASE_DEV_ENVIRONMENT' to a boolean, error: ", err)
		os.Exit(0)
	}

	// Set the Drop Flag
	SharedCode.DropDatabaseInDevEnvironment = tempDropFlag
	fmt.Printf("DROP_DATABASE_DEV_ENVIRONMENT value: %v\n", tempDropFlag)

	// **** Drop stuff in database-flag for Acc-environment ****
	tempDropFlag, err = strconv.ParseBool(mustGetenv("DROP_DATABASE_ACC_ENVIRONMENT"))
	if err != nil {
		fmt.Println("Couldn't convert environment variable 'DROP_DATABASE_ACC_ENVIRONMENT' to a boolean, error: ", err)
		os.Exit(0)
	}

	// Set the Drop Flag
	SharedCode.DropDatabaseInAccEnvironment = tempDropFlag
	fmt.Printf("DROP_DATABASE_ACC_ENVIRONMENT value: %v\n", tempDropFlag)

	// **** Relative Step Number for Dev-environment ****
	// Database migration is migrated relative steps, up or down
	var tempRelativeStepNumbersToMigrateInDevEnvironment int
	tempRelativeStepNumbersToMigrateInDevEnvironment, err = strconv.Atoi(mustGetenv("RELATIVE_DB_MIGRATION_STEP_DEV_ENVIRONMENT"))
	if err != nil {
		fmt.Println("Couldn't convert environment variable 'RELATIVE_DB_MIGRATION_STEP_DEV_ENVIRONMENT' to an integer, error: ", err)
		os.Exit(0)
	}

	// We now know that value is an integer
	SharedCode.RelativeStepNumbersToMigrateInDevEnvironment = tempRelativeStepNumbersToMigrateInDevEnvironment
	fmt.Println("RELATIVE_DB_MIGRATION_STEP_DEV_ENVIRONMENT: " + strconv.Itoa(SharedCode.RelativeStepNumbersToMigrateInDevEnvironment))

	// **** Relative Step Number for Acc-environment ****
	// Database migration is migrated relative steps, up or down
	var tempRelativeStepNumbersToMigrateInAccEnvironment int
	tempRelativeStepNumbersToMigrateInAccEnvironment, err = strconv.Atoi(mustGetenv("RELATIVE_DB_MIGRATION_STEP_ACC_ENVIRONMENT"))
	if err != nil {
		fmt.Println("Couldn't convert environment variable 'RELATIVE_DB_MIGRATION_STEP_ACC_ENVIRONMENT' to an integer, error: ", err)
		os.Exit(0)
	}

	// We now know that value is an integer
	SharedCode.RelativeStepNumbersToMigrateInAccEnvironment = tempRelativeStepNumbersToMigrateInAccEnvironment
	fmt.Println("RELATIVE_DB_MIGRATION_STEP_ACC_ENVIRONMENT: " + strconv.Itoa(SharedCode.RelativeStepNumbersToMigrateInAccEnvironment))

	// Get ENVIRONMENT variable to tell if the migration use relative steps or use the target step as input.
	// Allowed values are: 'UseTargetStep' or 'UseRelativeSteps'"
	// Dev Environment
	var tempUseTargetStepOrReleativeSteps = mustGetenv("USE_TARGET_OR_RELATIVE_STEP_DURING_DB_MIGRATION_DEV_ENVIRONMENT")

	switch tempUseTargetStepOrReleativeSteps {
	case "UseTargetStep":
		SharedCode.UseTargetStepOrReleativeStepsToMigrateInDevEnvironment = SharedCode.UseTargetStep

	case "UseRelativeSteps":
		SharedCode.UseTargetStepOrReleativeStepsToMigrateInDevEnvironment = SharedCode.UseRelativeSteps

	default:
		fmt.Println("Unknown value for USE_TARGET_OR_RELATIVE_STEP_DURING_DB_MIGRATION_DEV_ENVIRONMENT: " + tempUseTargetStepOrReleativeSteps + ". Expected one of the following: 'UseTargetStep' or 'UseRelativeSteps'")
		os.Exit(0)
	}
	fmt.Println("USE_TARGET_OR_RELATIVE_STEP_DURING_DB_MIGRATION_DEV_ENVIRONMENT: " + SharedCode.UseTargetStepOrReleativeStepsTypeMap[SharedCode.UseTargetStepOrReleativeStepsToMigrateInDevEnvironment])

	// Get ENVIRONMENT variable to tell if the migration use relative steps or use the target step as input.
	// Allowed values are: 'UseTargetStep' or 'UseRelativeSteps'"
	// Acc Environment
	tempUseTargetStepOrReleativeSteps = mustGetenv("USE_TARGET_OR_RELATIVE_STEP_DURING_DB_MIGRATION_ACC_ENVIRONMENT")

	switch tempUseTargetStepOrReleativeSteps {
	case "UseTargetStep":
		SharedCode.UseTargetStepOrReleativeStepsToMigrateInAccEnvironment = SharedCode.UseTargetStep

	case "UseRelativeSteps":
		SharedCode.UseTargetStepOrReleativeStepsToMigrateInAccEnvironment = SharedCode.UseRelativeSteps

	default:
		fmt.Println("Unknown value for USE_TARGET_OR_RELATIVE_STEP_DURING_DB_MIGRATION_ACC_ENVIRONMENT: " + tempUseTargetStepOrReleativeSteps + ". Expected one of the following: 'UseTargetStep' or 'UseRelativeSteps'")
		os.Exit(0)
	}
	fmt.Println("USE_TARGET_OR_RELATIVE_STEP_DURING_DB_MIGRATION_ACC_ENVIRONMENT: " + SharedCode.UseTargetStepOrReleativeStepsTypeMap[SharedCode.UseTargetStepOrReleativeStepsToMigrateInAccEnvironment])

	// Set the Update Password Flag for Dev environment
	tempUpdatePassword, err := strconv.ParseBool(mustGetenv("UPDATE_PASSWORD_DEV_ENVIRONMENT"))
	if err != nil {
		fmt.Println("Couldn't convert environment variable 'UPDATE_PASSWORD_DEV_ENVIRONMENT' to a boolean, error: ", err)
		os.Exit(0)
	}

	// Set the Update Password Flag
	SharedCode.UpdatePasswordInDevEnvironment = tempUpdatePassword
	fmt.Printf("UPDATE_PASSWORD_DEV_ENVIRONMENT value: %v\n", tempUpdatePassword)

	// Set the Update Password Flag for Acc environment
	tempUpdatePassword, err = strconv.ParseBool(mustGetenv("UPDATE_PASSWORD_ACC_ENVIRONMENT"))
	if err != nil {
		fmt.Println("Couldn't convert environment variable 'UPDATE_PASSWORD_ACC_ENVIRONMENT' to a boolean, error: ", err)
		os.Exit(0)
	}

	// Set the Update Password Flag
	SharedCode.UpdatePasswordInAccEnvironment = tempUpdatePassword
	fmt.Printf("UPDATE_PASSWORD_ACC_ENVIRONMENT value: %v\n", tempUpdatePassword)

	// Get environment variable for DB-password when running locally
	SharedCode.DB_PASS_WhenRunLocally = mustGetenv("DB_PASS")
	fmt.Println("DB_PASS: " + SharedCode.DB_PASS_WhenRunLocally)

}
