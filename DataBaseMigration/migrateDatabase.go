package DataBaseMigration

import (
	"database/sql"
	"embed"
	SharedCode2 "fenix-database-administration/SharedCode"
	"fmt"
	"github.com/golang-migrate/migrate/v4"
	"github.com/golang-migrate/migrate/v4/database/postgres"
	"github.com/golang-migrate/migrate/v4/source/iofs"
	"github.com/sirupsen/logrus"
	"log"
	"os"
)

func MustGetEnvironmentVariable(k string) string {
	v := os.Getenv(k)
	if v == "" {
		log.Fatalf("Warning: %s environment variable not set.\n", k)
	}
	return v
}

// General code for migrating database, up or dowm, regarding what tables and data that exist within the database
func migrateDatabase(targetDatabase string,
	embeddedFiles *embed.FS,
	targetMigrationStepNumberInDevEnvironment int,
	targetMigrationStepNumberInAccEnvironment int,
	pathForEmbededFiles string,
	schemaName string,
	forceTargetMigrationStepNumberInDevEnvironment bool,
	forceTargetMigrationStepNumberInAccEnvironment bool,
	dropDatabaseInDevEnvironment bool,
	dropDatabaseInAccEnvironment bool,
	relativeMigrationStepsInDevEnvironment int,
	relativeMigrationStepsInAccEnvironment int,
	useTargetStepOrRelativeStepsToMigrateInDevEnvironment SharedCode2.UseTargetStepOrReleativeStepsType,
	useTargetStepOrRelativeStepsToMigrateInAccEnvironment SharedCode2.UseTargetStepOrReleativeStepsType,
) {

	SharedCode2.Logger.WithFields(logrus.Fields{
		"id": "8cd88198-9491-464c-b542-079bf6171846",
		"targetMigrationStepNumberInDevEnvironment":             targetMigrationStepNumberInDevEnvironment,
		"targetMigrationStepNumberInAccEnvironment":             targetMigrationStepNumberInAccEnvironment,
		"pathForEmbededFiles":                                   pathForEmbededFiles,
		"schemaName":                                            schemaName,
		"targetDatabase":                                        targetDatabase,
		"dropDatabaseInDevEnvironment":                          dropDatabaseInDevEnvironment,
		"dropDatabaseInAccEnvironment":                          dropDatabaseInAccEnvironment,
		"relativeMigrationStepsInDevEnvironment":                relativeMigrationStepsInDevEnvironment,
		"relativeMigrationStepsInAccEnvironment":                relativeMigrationStepsInAccEnvironment,
		"forceTargetMigrationStepNumberInDevEnvironment":        forceTargetMigrationStepNumberInDevEnvironment,
		"forceTargetMigrationStepNumberInAccEnvironment":        forceTargetMigrationStepNumberInAccEnvironment,
		"useTargetStepOrRelativeStepsToMigrateInDevEnvironment": useTargetStepOrRelativeStepsToMigrateInDevEnvironment,
		"useTargetStepOrRelativeStepsToMigrateInAccEnvironment": useTargetStepOrRelativeStepsToMigrateInAccEnvironment,
	}).Info("Incoming data to 'migrateDatabase'")

	defer SharedCode2.Logger.WithFields(logrus.Fields{
		"Id": "c367a0f8-b237-444a-a05d-f248b3bebed0",
	}).Info("Exiting - migrateDatabase")

	// Load stored secret from Secret Manager
	var passwordFromSecretManager string
	var err error
	var relativeMigrationSteps int
	var targetMigrationStep int
	var useForceMigrationToTargetStep bool
	var dropDatabase bool
	var useTargetStepOrRelativeStepsToMigrate SharedCode2.UseTargetStepOrReleativeStepsType

	// Check if there should be any migration
	switch SharedCode2.ExecutionEnvironment {
	case SharedCode2.DEV:
		targetMigrationStep = targetMigrationStepNumberInDevEnvironment
		useForceMigrationToTargetStep = forceTargetMigrationStepNumberInDevEnvironment
		dropDatabase = dropDatabaseInDevEnvironment
		relativeMigrationSteps = relativeMigrationStepsInDevEnvironment
		useTargetStepOrRelativeStepsToMigrate = useTargetStepOrRelativeStepsToMigrateInDevEnvironment

	case SharedCode2.ACC:
		targetMigrationStep = targetMigrationStepNumberInAccEnvironment
		useForceMigrationToTargetStep = forceTargetMigrationStepNumberInAccEnvironment
		dropDatabase = dropDatabaseInAccEnvironment
		relativeMigrationSteps = relativeMigrationStepsInAccEnvironment
		useTargetStepOrRelativeStepsToMigrate = useTargetStepOrRelativeStepsToMigrateInAccEnvironment

	default:
		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":                              "1d201796-417b-4b9c-9056-248d8c8fb995",
			"SharedCode.ExecutionEnvironment": SharedCode2.ExecutionEnvironment,
		}).Error("Unknown environment")

		return

	}

	SharedCode2.Logger.WithFields(logrus.Fields{
		"id":                            "693f045c-3ad5-4a28-bfed-357683b963a2",
		"targetMigrationStep":           targetMigrationStep,
		"useForceMigrationToTargetStep": useForceMigrationToTargetStep,
		"dropDatabase":                  dropDatabase,
		"relativeMigrationSteps":        relativeMigrationSteps,
	}).Info("Migrate to the following Step Number")

	if targetMigrationStep < 0 {
		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":                              "d9868091-9a34-4ade-9ccd-e4355c22e3af",
			"targetMigrationStep":             targetMigrationStep,
			"SharedCode.ExecutionEnvironment": SharedCode2.ExecutionEnvironment,
		}).Info("Nothing to migrate due to that Target Step Number is set to less than zero")

		return
	}

	// Get latest password
	if SharedCode2.ExecutionLocation == SharedCode2.GCP {
		passwordFromSecretManager, err = SharedCode2.AccessSecretVersion(
			SharedCode2.SecretManagerPathForPostgresDbPassword + SharedCode2.LatestSecretVersion)
	} else {
		passwordFromSecretManager = SharedCode2.DB_PASS_WhenRunLocally
	}

	if err != nil {

		// Only log passwords in DEV-environment
		if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":  "d5d24805-854c-446d-8b65-5b2d876bfe56",
				"err": err,
				"SharedCode.SecretManagerPathForPostgresDbPassword+version": SharedCode2.SecretManagerPathForPostgresDbPassword + SharedCode2.LatestSecretVersion,
				"passwordFromSecretManager":                                 passwordFromSecretManager,
			}).Error("Problem when reading the latest secret from Secret Manager")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":  "4d8a5f6f-d28d-4ce2-8492-ca462651ce0e",
				"err": err,
				"SharedCode.SecretManagerPathForPostgresDbPassword+version": SharedCode2.SecretManagerPathForPostgresDbPassword + SharedCode2.LatestSecretVersion,
				"passwordFromSecretManager":                                 "xxxxxxxxxxxxxxxxxx",
			}).Error("Problem when reading the latest secret from Secret Manager")
		}
		return

	} else {

		// Only log passwords in DEV-environment
		if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id": "8641be14-caae-43a2-8f5b-62778a30a0c8",
				"SharedCode.SecretManagerPathForPostgresDbPassword+version": SharedCode2.SecretManagerPathForPostgresDbPassword + SharedCode2.LatestSecretVersion,
				"passwordFromSecretManager":                                 passwordFromSecretManager,
			}).Info("Success in reading secret in Secret Manager for user")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id": "3e15b0dd-e3ba-4bd0-a368-dda75329f8b4",
				"SharedCode.SecretManagerPathForPostgresDbPassword+version": SharedCode2.SecretManagerPathForPostgresDbPassword + SharedCode2.LatestSecretVersion,
				"passwordFromSecretManager":                                 "xxxxxxxxxxxxxxxxxx",
			}).Info("Success in reading secret in Secret Manager for user")
		}

	}
	// Get Cloud SQL instance connection name
	connectionName := SharedCode2.DatabaseInstanceConnectionName //os.Getenv("INSTANCE_CONNECTION_NAME")

	var dbURI string
	var socketDir string

	var (
		dbUser    = MustGetEnvironmentVariable("DB_USER") // e.g. 'my-db-user'
		dbPwd     = MustGetEnvironmentVariable("DB_PASS") // e.g. 'my-db-password'
		dbTCPHost = MustGetEnvironmentVariable("DB_HOST") // e.g. '127.0.0.1' ('172.17.0.1' if deployed to GAE Flex)
		dbPort    = MustGetEnvironmentVariable("DB_PORT") // e.g. '5432'
		dbName    = MustGetEnvironmentVariable("DB_NAME") // e.g. 'my-database'
	)

	if SharedCode2.ExecutionLocation == SharedCode2.LocalhostNoDocker {

		dbURI = fmt.Sprintf("host=%s user=%s password=%s port=%s database=%s sslmode=disable", dbTCPHost, dbUser, dbPwd, dbPort, dbName)

	} else {

		//var dbInstanceConnectionName = MustGetEnvironmentVariable("DB_INSTANCE_CONNECTION_NAME")

		socketDir, isSet := os.LookupEnv("DB_SOCKET_DIR")
		if !isSet {
			socketDir = "/cloudsql"
		}

		dbURI = fmt.Sprintf("user=%s password=%s database=%s host=%s/%s pool_max_conns=%s", dbUser, dbPwd, dbName, socketDir)

		//socketDir := "/cloudsql"
		dbURI = fmt.Sprintf("user=%s password=%s database=%s host=%s/%s",
			SharedCode2.DbUserName_postgres,
			passwordFromSecretManager,
			targetDatabase,
			socketDir,
			connectionName)
	}

	// Is only used in for logging
	dbURIacc := fmt.Sprintf("user=%s password=%s database=%s host=%s/%s",
		SharedCode2.DbUserName_postgres,
		"xxxxxxxxxxxxxxxxxx",
		targetDatabase,
		socketDir,
		connectionName)

	// Only log passwords in DEV-environment
	if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":    "351ae22c-9f34-4d9f-a8fa-d9670f1cb94c",
			"dbURI": dbURI,
		}).Debug("Use this database connection string")

	} else {

		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":    "2f7db38e-b5ff-4a04-9615-593e81ac7d33",
			"dbURI": dbURIacc,
		}).Debug("Use this database connection string")
	}

	db, err := sql.Open("postgres", dbURI) //"postgres://user:password@localhost:5432/dbname?sslmode=disable&host=/cloudsql/project-id:region:instance-name")
	defer db.Close()
	if err != nil {

		// Only log passwords in DEV-environment
		if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":    "427a83ac-ac7c-4d57-92f1-25fc2c84513f",
				"err":   err,
				"dbURI": dbURI,
			}).Error("Failed to connect to the database")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":    "fe3e3aab-5e6f-4b70-a8d6-c56b713bd3b8",
				"err":   err,
				"dbURI": dbURIacc,
			}).Error("Failed to connect to the database")
		}

		return

	}

	// Get database version from the Database, to verify connection to db
	var databaseVersion string
	err = db.QueryRow("SELECT VERSION()").Scan(&databaseVersion)
	if err != nil {
		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":  "28d62608-fb53-4910-9185-94ff2ea13de6",
			"err": err,
		}).Error("Problem when testing connection to database")

		return

	} else {

		// Only log passwords in DEV-environment
		if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":              "4f967e29-69a4-4c35-a068-0442730e539c",
				"dbURI":           dbURI,
				"databaseVersion": databaseVersion,
			}).Info("Connection OK to database")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":              "41234063-287a-41ed-9f5e-336498271d38",
				"dbURI":           dbURIacc,
				"databaseVersion": databaseVersion,
			}).Info("Connection OK to database")
		}
	}
	/*
		// Ping the database to make sure the connection is working
		if err = db.Ping(); err != nil {

			SharedCode.Logger.WithFields(logrus.Fields{
				"Id":    "0a1969af-661a-4007-b5d3-2b89148a1fc2",
				"err":   err,
				"dbURI": dbURI,
			}).Error("Failed to ping the database")

			return

		}

	*/

	sourceDriver, err := iofs.New(embeddedFiles, pathForEmbededFiles) //"migration_sql/FenixAdministration")
	if err != nil {
		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":                  "7c4ce3a2-fb4b-4335-9f88-538722ff0c4b",
			"err":                 err,
			"pathForEmbededFiles": pathForEmbededFiles,
		}).Error("Problem generating new Driver from io/fs#FS and a relative path.")

		return
	}

	databaseDriver, err := postgres.WithInstance(db, &postgres.Config{})
	migrationObject, err := migrate.NewWithInstance("iofs", sourceDriver, targetDatabase, databaseDriver)
	if err != nil {

		// Only log passwords in DEV-environment
		if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":    "9b48d99f-063f-43f4-be1a-074390511970",
				"err":   err,
				"dbURI": dbURI,
			}).Error("Problem generating a new Migrate instance from an existing source instance and a database URL")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":    "68d56ba5-b5be-42b6-98e7-9efb3bb897f2",
				"err":   err,
				"dbURI": dbURIacc,
			}).Error("Problem generating a new Migrate instance from an existing source instance and a database URL")

		}

		return

	} else {
		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id": "fe1a4f89-d106-4e9d-aaee-3f70814f0033",
		}).Info("Success in creating new 'migrationObject'")
	}

	// Enable logging for migrations using the logrus logger
	migrationObject.Log = &SharedCode2.MigrateLogger{
		Logger: SharedCode2.Logger,
	}

	// Check if Schema exists, because if it exists then first step in Database Migration has been done
	var schemaExists bool
	schemaExists, err = checkSchemaExists(db, schemaName)
	if err != nil {
		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":         "8f84bef0-9675-4377-8d55-9c327c2ce442",
			"err":        err,
			"schemaName": schemaName,
		}).Error("Couldn't check if Schema exists within database, exiting migration!")

		return

	} else {

		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":             "4e28b46a-5330-43c2-9b90-cfad650b92ef",
			"schemaName":     schemaName,
			"targetDatabase": targetDatabase,
			"schemaExists":   schemaExists,
		}).Info("Schema might exist in  database")
	}

	// Only check for tables if the Schema exists
	if schemaExists == true {

		var tablesInDatabase []string
		tablesInDatabase, err = listTablesInDatabase(db, schemaName)

		if err != nil {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":           "046dbb21-f67d-48c9-ab3b-7b56fcac71bf",
				"err":          err,
				"schema":       schemaName,
				"schemaExists": schemaExists,
			}).Error("Couldn't list tables in database")

			return

		} else {

			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":               "9ec46b3f-c216-401c-a0a1-1bda640124d2",
				"schema":           schemaName,
				"schemaExists":     schemaExists,
				"tablesInDatabase": tablesInDatabase,
			}).Info("Tables in Schema")
		}

	} else {
		// Schema doesn't exist
		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":           "17f64eaf-8a50-4585-ada3-970ec8c6291f",
			"schema":       schemaName,
			"schemaExists": schemaExists,
		}).Info("Schema doesn't exit")

	}

	// Get Current migration version before migrating database
	version, isDirty, err := migrationObject.Version()
	if err != nil {
		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":  "b3fc3a1d-3660-40bd-b27c-4353766b4ede",
			"err": err,
		}).Info("Couldn't get version before migrating database")

	} else {

		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":                              "ef0df03f-0c60-4e75-8aa7-24dc3753fc3c",
			"SharedCode.ExecutionEnvironment": SharedCode2.ExecutionEnvironment,
			"version":                         version,
			"isDirty":                         isDirty,
		}).Info("Current migration-version, before migration, in database")
	}

	// Decide which method to use during Migration
	var methodFound bool
	type migrationMethodType uint8
	const (
		migrationMethodNoValue migrationMethodType = iota
		migrationMethodForce
		migrationMethodUp
		migrationMethodDown
		migrationMethodSteps
		migrationMethodDrop
		migrationMethodMigrate
	)
	var migrationMethod migrationMethodType

	// Should 'migrationObject.Drop()' be applied
	if dropDatabase == true && methodFound == false {

		methodFound = true
		migrationMethod = migrationMethodDrop

	}

	// Should 'migrationObject.Force(n)' be applied
	if useForceMigrationToTargetStep == true && methodFound == false {

		methodFound = true
		migrationMethod = migrationMethodForce

	}

	// Should 'migrationObject.Up()' be applied
	if useTargetStepOrRelativeStepsToMigrate == SharedCode2.UseTargetStep &&
		targetMigrationStep == 6666 &&
		methodFound == false {

		methodFound = true
		migrationMethod = migrationMethodUp

	}

	// Should 'migrationObject.Down()' be applied
	if useTargetStepOrRelativeStepsToMigrate == SharedCode2.UseTargetStep &&
		targetMigrationStep == 0 &&
		methodFound == false {

		methodFound = true
		migrationMethod = migrationMethodDown

	}

	// Should 'migrationObject.Steps(n)' be applied
	if useTargetStepOrRelativeStepsToMigrate == SharedCode2.UseRelativeSteps && methodFound == false {

		methodFound = true
		migrationMethod = migrationMethodSteps

	}

	// Should 'migrationObject.Migrate(n)' be applied
	if useTargetStepOrRelativeStepsToMigrate == SharedCode2.UseTargetStep && methodFound == false {

		methodFound = true
		migrationMethod = migrationMethodMigrate

	}

	// Migrate Database
	switch migrationMethod {

	case migrationMethodNoValue:
		// Shouldn't happen
		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":                                    "fe57de85-587c-454b-8bf8-216dd2674ada",
			"migrationMethod":                       migrationMethod,
			"methodFound":                           methodFound,
			"useForceMigrationToTargetStep":         useForceMigrationToTargetStep,
			"useTargetStepOrRelativeStepsToMigrate": useTargetStepOrRelativeStepsToMigrate,
			"targetMigrationStep":                   targetMigrationStep,
		}).Error("No Migration method was set")

		return

	case migrationMethodDrop:
		// Drop everything in the database
		err = migrationObject.Drop()

		if err != nil {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":  "eb68f7fd-3782-415a-9601-8f855cf3b604",
				"err": err,
			}).Error("Problem when doing 'migrationObject.Drop()'")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id": "a3a49218-f6be-44fd-9c83-07cf902aeeed",
			}).Info("Success in doing 'migrationObject.Drop()'")

		}

	case migrationMethodForce:
		// When using force-flag you specify the target instead of number of steps
		err = migrationObject.Force(targetMigrationStep)

		if err != nil {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                  "5f6ba8f6-b534-4027-87d9-4cf5dd8546b8",
				"err":                 err,
				"targetMigrationStep": targetMigrationStep,
			}).Error("Problem when doing 'migrationObject.Force(targetMigrationStep)'")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                  "726c8a84-793e-4877-9993-bf3041535f9e",
				"targetMigrationStep": targetMigrationStep,
			}).Info("Success in doing 'migrationObject.Force(targetMigrationStep)'")

		}

	case migrationMethodUp:
		// Migrate Up
		err = migrationObject.Up()

		if err != nil {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":  "c863545b-9327-479c-8d26-541274288fbf",
				"err": err,
			}).Error("Problem when doing 'migrationObject.Up()'")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id": "1c8251ea-ea8e-45a1-9272-34be2208eb76",
			}).Info("Success in doing 'migrationObject.Up()'")

		}

	case migrationMethodDown:
		// Migrate Down
		err = migrationObject.Down()

		if err != nil {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":  "02caa593-05da-4c2d-9e4d-a72e19c9e36e",
				"err": err,
			}).Error("Problem when doing 'migrationObject.Down()'")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id": "0c6c2fdd-48fd-4ede-bd6c-dd37a53f4d9c",
			}).Info("Success in doing 'migrationObject.Down()'")

		}

	case migrationMethodSteps:

		// Migrate relative to current step
		err = migrationObject.Steps(relativeMigrationSteps)

		if err != nil {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                     "8087cf7a-6bbc-4461-9ad8-0f2377dfb288",
				"err":                    err,
				"relativeMigrationSteps": relativeMigrationSteps,
			}).Error("Problem when doing 'migrationObject.Steps(relativeMigrationSteps)'")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                     "67306f58-3f8c-424c-b937-41e047cb490b",
				"relativeMigrationSteps": relativeMigrationSteps,
			}).Info("Success in doing 'migrationObject.Steps(relativeMigrationSteps)'")

		}

	case migrationMethodMigrate:
		// Migrate to specific step
		err = migrationObject.Migrate(uint(targetMigrationStep))

		if err != nil {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                  "8108d143-47dd-4812-a4cc-b44def9dcc24",
				"err":                 err,
				"targetMigrationStep": targetMigrationStep,
			}).Error("Problem when doing 'migrationObject.Migrate(targetMigrationStep)'")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                  "f9d615c3-34fa-4007-8506-ecfc22d23d71",
				"targetMigrationStep": targetMigrationStep,
			}).Info("Success in doing 'migrationObject.Migrate(targetMigrationStep)'")

		}

	default:

		if methodFound == false {

			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":              "419d9b6e-7256-415b-8f7f-7be0317ff52e",
				"migrationMethod": migrationMethod,
				"methodFound":     methodFound,
			}).Error("migrationMethod was now not found")

			return
		}

	}

	// Get new  migration-verion after migrating database
	version, isDirty, err = migrationObject.Version()
	if err != nil {
		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":  "297ed44d-ad45-4834-847d-23d92ae5dcd7",
			"err": err,
		}).Error("Couldn't get migration-version from database after successful Migration")

	} else {

		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":      "1704275c-379c-4237-ab77-61b84ca73214",
			"version": version,
			"isDirty": isDirty,
		}).Info("Current migration-version, after  successful Migration")
	}

	// Check for tables
	var tablesInDatabase []string
	tablesInDatabase, err = listTablesInDatabase(db, schemaName)

	if err != nil {
		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":           "72d65f71-8aef-4306-93db-e9a00fd063d0",
			"err":          err,
			"schema":       schemaName,
			"schemaExists": schemaExists,
		}).Error("Couldn't list tables in database")

		return

	} else {

		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":               "d6355c76-e762-48cd-9ef5-1e5588c511e9",
			"schema":           schemaName,
			"schemaExists":     schemaExists,
			"tablesInDatabase": tablesInDatabase,
		}).Info("Tables in Schema")
	}

	err = listPermissions(db)

	if err != nil {
		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":  "975128b4-3032-4339-9003-9bdb46820eb2",
			"err": err,
		}).Error("Couldn't list Permission in database")

		return

	}

}

// // Check if the schema exists
func checkSchemaExists(db *sql.DB, schemaName string) (bool, error) {
	var exists bool
	err := db.QueryRow("SELECT EXISTS (SELECT 1 FROM pg_namespace WHERE nspname = $1)", schemaName).Scan(&exists)
	if err != nil {
		return false, err
	}
	return exists, nil
}

func listTablesInDatabase(db *sql.DB, schemaName string) (tablesInDatabase []string, err error) {

	var sqlToExecute string

	sqlToExecute = ""
	sqlToExecute = sqlToExecute + "SELECT tablename "
	sqlToExecute = sqlToExecute + "FROM pg_tables "
	sqlToExecute = sqlToExecute + "WHERE schemaname IN ('" + SharedCode2.DBNameFenixDatabasesSchemaFenixBuilder + "', "
	sqlToExecute = sqlToExecute + "'" + SharedCode2.DBNameFenixDatabasesSchemaFenixDomainAdministration + "') ;"
	//sqlToExecute = sqlToExecute + "WHERE schemaname = '" + schemaName + "'; "
	//sqlToExecute = sqlToExecute + "AND table_type = 'BASE TABLE';"

	// Execute the SQL query to list tables
	rows, err := db.Query(sqlToExecute)

	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	// Iterate over the result rows and print the table names
	for rows.Next() {
		var tableName string
		err := rows.Scan(&tableName)
		if err != nil {
			log.Fatal(err)
		}
		tablesInDatabase = append(tablesInDatabase, tableName)
	}

	if err = rows.Err(); err != nil {
		return nil, err
	}

	return tablesInDatabase, err
}

func listPermissions(db *sql.DB) (err error) {

	var sqlToExecute string

	sqlToExecute = ""
	sqlToExecute = sqlToExecute + "SELECT * "
	sqlToExecute = sqlToExecute + "FROM information_schema.role_table_grants "
	sqlToExecute = sqlToExecute + "WHERE table_name = 'DomainParameters';"

	// Execute the SQL query to list tables
	rows, err := db.Query(sqlToExecute)

	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	type rowStruct struct {
		granter        string
		grantee        string
		table_catalog  string
		table_schema   string
		table_name     string
		privilege_type string
		is_grantable   string
		with_hierarchy string
	}
	var rowsSlice []rowStruct

	// Iterate over the result rows and print the table names
	for rows.Next() {
		var tableRow rowStruct
		err := rows.Scan(&tableRow.granter, &tableRow.grantee, &tableRow.table_catalog, &tableRow.table_schema, &tableRow.table_name, &tableRow.privilege_type, &tableRow.is_grantable, &tableRow.with_hierarchy)
		if err != nil {
			log.Fatal(err)
		}
		rowsSlice = append(rowsSlice, tableRow)
	}

	if err = rows.Err(); err != nil {
		return err
	}

	SharedCode2.Logger.WithFields(logrus.Fields{
		"Id":        "c0610654-9faf-4cb9-b209-95ac6ee77ea8",
		"rowsSlice": rowsSlice,
	}).Info("All privilege for \"FenixExecution\".\"DomainParameters\" ")

	return err
}

/*
func listTableSchemaMigration(db *sql.DB, schemaName string) (err error) {

	var sql string

	sql = ""
	sql = sql + "SELECT * "
	sql = sql + "FROM schema_migrations; "
	sql = sql + "WHERE schema_migrations = '" + SharedCode.DBNameFenixDatabasesSchemaFenixBuilder + "' OR "
	//sql = sql + "schemaname = '" + SharedCode.DBNameFenixDatabasesSchemaFenixDomainAdministration + "' ;"
	//sql = sql + "WHERE schemaname = '" + schemaName + "'; "
	//sql = sql + "AND table_type = 'BASE TABLE';"

	// Execute the SQL query to list tables
	rows, err := db.Query(sql)

	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()

	// Iterate over the result rows and print the table names
	for rows.Next() {
		var tableName string
		err := rows.Scan(&tableName)
		if err != nil {
			log.Fatal(err)
		}
		tablesInDatabase = append(tablesInDatabase, tableName)
	}

	if err = rows.Err(); err != nil {
		return nil, err
	}

	return tablesInDatabase, err
}


*/
