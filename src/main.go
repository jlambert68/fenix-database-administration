package main

import (
	"fenix-database-administration/src/DataBaseMigration"
	"fenix-database-administration/src/DatabasePasswordChanger"
	"fenix-database-administration/src/SharedCode"
	gRPCServer "fenix-database-administration/src/gRPC"
	"github.com/sirupsen/logrus"
)

func main() {

	// Set up logging
	SharedCode.InitLogger()

	// The Target Database
	SharedCode.DBNameToTarget = SharedCode.DBNameFenixStandardDatabase

	SharedCode.Logger.WithFields(logrus.Fields{
		"id":                                "a36a4003-3340-41dd-8b70-d9acf052f415",
		"SharedCode.ApplicationRuntimeUuid": SharedCode.ApplicationRuntimeUuid,
	}).Debug("ApplicationRuntimeUuid create for this instance")

	// Stop gRPC-server before exiting
	defer gRPCServer.GRPCServerObject.StopGrpcServer()

	// Start gRPC-server
	go gRPCServer.GRPCServerObject.InitGrpcServer()

	// Update password for DB-user 'fenix-cloudrun-dbuser'
	DatabasePasswordChanger.UpdateUsersDatabasePassword(
		SharedCode.ProjectId,
		SharedCode.DatabaseInstanceName,
		SharedCode.SecretManagerPathForFenixUserDbPassword,
		SharedCode.LatestSecretVersion,
		SharedCode.DbUserName_fenix_user)

	// Update password for DB-user 'postgres'
	DatabasePasswordChanger.UpdateUsersDatabasePassword(
		SharedCode.ProjectId,
		SharedCode.DatabaseInstanceName,
		SharedCode.SecretManagerPathForPostgresDbPassword,
		SharedCode.LatestSecretVersion,
		SharedCode.DbUserName_postgres)

	// Migrate database
	DataBaseMigration.MigrateFenixDatabase(SharedCode.DBNameToTarget)

	// Create a channel of type bool and wait
	ch := make(chan bool)
	<-ch

}
