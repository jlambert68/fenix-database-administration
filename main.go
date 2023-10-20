package main

import (
	"fenix-database-administration/DataBaseMigration"
	SharedCode2 "fenix-database-administration/SharedCode"
	"fenix-database-administration/gRPC"
	"github.com/sirupsen/logrus"
)

func main() {

	// Set up logging
	SharedCode2.InitLogger()

	// The Target Database
	SharedCode2.DBNameToTarget = SharedCode2.DBNameFenixStandardDatabase

	SharedCode2.Logger.WithFields(logrus.Fields{
		"id":                                "a36a4003-3340-41dd-8b70-d9acf052f415",
		"SharedCode.ApplicationRuntimeUuid": SharedCode2.ApplicationRuntimeUuid,
	}).Debug("ApplicationRuntimeUuid create for this instance")

	// Stop gRPC-server before exiting
	defer gRPCServer.GRPCServerObject.StopGrpcServer()

	// Start gRPC-server
	go gRPCServer.GRPCServerObject.InitGrpcServer()

	// Don't need to update password in an existing environment
	// Update password for DB-user 'fenix-cloudrun-dbuser'
	/*
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
	*/

	// Migrate database
	DataBaseMigration.MigrateFenixDatabase(SharedCode2.DBNameToTarget)

	// Create a channel of type bool and wait
	ch := make(chan bool)
	<-ch

}
