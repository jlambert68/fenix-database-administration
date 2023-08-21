package DatabasePasswordChanger

import (
	"context"
	"fenix-database-administration/src/SharedCode"
	"fmt"
	"github.com/jackc/pgx/v4/pgxpool"
	"github.com/sirupsen/logrus"
	"log"
	"os"
)

var dbPool *pgxpool.Pool

// mustGetEnv is a helper function for getting environment variables.
// Displays a warning if the environment variable is not set.
func MustGetEnvironmentVariable(k string) string {
	v := os.Getenv(k)
	if v == "" {
		//log.Fatalf("Warning: %s environment variable not set.\n", k)
		log.Printf("Warning: %s environment variable not set.\n", k)
	}
	return v
}

func ConnectToDB(dbUser string, dbPwd string, dbName string) (databaseVersion string) {

	var dbURI string
	var err error

	var (
		dbTCPHost = "GCP"  //"127.0.0.1"     //"GCP"           // MustGetEnvironmentVariable("DB_HOST") // e.g. '127.0.0.1' ('172.17.0.1' if deployed to GAE Flex)
		dbPort    = "5432" // MustGetEnvironmentVariable("DB_PORT") // e.g. '5432'
		//dbName    = "postgres" // MustGetEnvironmentVariable("DB_NAME") // e.g. 'my-database'
		dbURIacc string
	)

	// If the optional DB_HOST environment variable is set, it contains
	// the IP address and port number of a TCP connection pool to be created,
	// such as "127.0.0.1:5432". If DB_HOST is not set, a Unix socket
	// connection pool will be created instead.
	if dbTCPHost != "GCP" {
		dbURI = fmt.Sprintf("host=%s user=%s password=%s port=%s database=%s", dbTCPHost, dbUser, dbPwd, dbPort, dbName)

	} else {

		var dbInstanceConnectionName = SharedCode.DatabaseInstanceConnectionName //MustGetEnvironmentVariable("INSTANCE_CONNECTION_NAME")

		socketDir, isSet := os.LookupEnv("DB_SOCKET_DIR")
		if !isSet {
			socketDir = "/cloudsql"
		}

		//encPassword := encryptPostgresPassword(dbPwd)

		dbURI = fmt.Sprintf("user=%s password=%s database=%s host=%s/%s", dbUser, dbPwd, dbName, socketDir, dbInstanceConnectionName)

		// Only used for logging in AccTest environment
		dbURIacc = fmt.Sprintf("user=%s password=%s database=%s host=%s/%s", dbUser, "xxxxxxxxxxxxxxxxxx", dbName, socketDir, dbInstanceConnectionName)
	}

	// Only log passwords in DEV-environment
	if SharedCode.ExecutionEnvironment == SharedCode.DEV {
		SharedCode.Logger.WithFields(logrus.Fields{
			"Id":    "e1638a08-37ca-478d-902e-9a6cc0072c2f",
			"dbURI": dbURI,
		}).Debug("Use this database connection string")

	} else {
		SharedCode.Logger.WithFields(logrus.Fields{
			"Id":    "8061e42b-77fb-4e0a-8c56-262430c32bd5",
			"dbURI": dbURIacc,
		}).Debug("Use this database connection string")
	}

	dbPool, err = pgxpool.Connect(context.Background(), dbURI)
	if err != nil {

		SharedCode.Logger.WithFields(logrus.Fields{
			"Id":  "b5443c43-c845-4828-9584-7c523adfbca0",
			"err": err,
		}).Error("Unable to connect to database")

		dbPool.Close()

		os.Exit(1)

	} else {

		SharedCode.Logger.WithFields(logrus.Fields{
			"Id": "d6aa5484-1fec-4293-b56d-9535709ec29b",
		}).Debug("Success in connecting to database")
	}

	// Get database version from the Database, to verify connection to db
	err = dbPool.QueryRow(context.Background(), "SELECT VERSION()").Scan(&databaseVersion)

	if err != nil {

		SharedCode.Logger.WithFields(logrus.Fields{
			"Id":  "d38e6090-df64-4211-b98d-f0510f9a2cde",
			"err": err,
		}).Error("QueryRow failed")

		dbPool.Close()

		os.Exit(1)
	}

	SharedCode.Logger.WithFields(logrus.Fields{
		"Id":              "d6aa5484-1fec-4293-b56d-9535709ec29b",
		"databaseVersion": databaseVersion,
	}).Debug("Success in retrieving database version")

	return databaseVersion
}
