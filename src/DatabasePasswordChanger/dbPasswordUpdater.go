package DatabasePasswordChanger

import (
	"context"
	"fenix-database-administration/src/SharedCode"
	"github.com/sirupsen/logrus"
	sql "google.golang.org/api/sql/v1beta4"
)

// https://jeanklaas.com/blog/automatic_rotation_cloudsql_password/

func updateUsersCloudSQLPassword(
	project string,
	databaseInstance string,
	usersDatabaseName string,
	newPassword []byte) (err error) {

	// Only log passwords in DEV-environment
	if SharedCode.ExecutionEnvironment == SharedCode.DEV {
		SharedCode.Logger.WithFields(logrus.Fields{
			"id":                "e689d3b4-a69a-4a89-b0d3-94dd2e6451f1",
			"project":           project,
			"databaseInstance":  databaseInstance,
			"usersDatabaseName": usersDatabaseName,
			"newPassword":       newPassword,
		}).Info("Incoming data to 'updateUsersCloudSQLPassword'")

	} else {
		SharedCode.Logger.WithFields(logrus.Fields{
			"id":                "dd1a59ac-77ce-405f-b518-20f358a5a8e8",
			"project":           project,
			"databaseInstance":  databaseInstance,
			"usersDatabaseName": usersDatabaseName,
			"newPassword":       "xxxxxxxxxxxxxxxxxx",
		}).Info("Incoming data to 'updateUsersCloudSQLPassword'")
	}

	ctx := context.Background()

	// Create new service to be able to change newPassword
	sqladminService, err := sql.NewService(ctx) //, option.WithScopes(sql.CloudPlatformScope))
	//sqladminService, err := sql.NewService(ctx, option.WithScopes(sql.SqlserviceAdminScope))
	if err != nil {
		SharedCode.Logger.WithFields(logrus.Fields{
			"id":  "87bb7d4e-c5c7-4641-9e5f-f78c27316c55",
			"err": err,
		}).Error("Couldn't generate new sql-Server for GCP-api")

		return err

	} else {
		SharedCode.Logger.WithFields(logrus.Fields{
			"id":              "b05cb3a0-188e-403b-a66d-941f73cec9a2",
			"sqladminService": sqladminService,
		}).Info("Generated 'sql.NewService'")
	}

	// Data to be change for the user. In this case only the newPassword
	userData := &sql.User{
		Password: string(newPassword[:]),
	}

	/*
		myDBInstances := sqladminService.Projects.Instances.List(project)
		SharedCode.Logger.WithFields(logrus.Fields{
			"id":            "f38c66d1-900e-44fd-ae42-bf67f39956e5",
			"myDBInstances": myDBInstances,
		}).Info("myDBInstances")

		myDatabases := sqladminService.Databases.List(project, databaseInstance)
		SharedCode.Logger.WithFields(logrus.Fields{
			"id":          "eba4b2db-9dd3-463e-8757-b4d6316efb7a",
			"myDatabases": myDatabases,
		}).Info("myDatabases")

		userList := sqladminService.Users.List(project, databaseInstance)
		SharedCode.Logger.WithFields(logrus.Fields{
			"id":       "a55147a5-5ced-4597-8c36-322d1a9bfad9",
			"userList": userList,
		}).Info("userList")
	*/
	// Change the users database users password
	operation, err := sqladminService.Users.Update(project, databaseInstance, userData).Name(usersDatabaseName).Context(ctx).Do()
	if err != nil {

		// Only log passwords in DEV-environment
		if SharedCode.ExecutionEnvironment == SharedCode.DEV {
			SharedCode.Logger.WithFields(logrus.Fields{
				"id":                "7d0256dc-122e-45cd-b0e2-369c8ffd1b18",
				"err":               err,
				"project":           project,
				"databaseInstance":  databaseInstance,
				"newPassword":       newPassword,
				"usersDatabaseName": usersDatabaseName,
				"operation":         operation,
			}).Error("Couldn't change users database password")

		} else {
			SharedCode.Logger.WithFields(logrus.Fields{
				"id":                "14e8ca34-a078-4011-adce-9afab72e89a1",
				"err":               err,
				"project":           project,
				"databaseInstance":  databaseInstance,
				"newPassword":       "xxxxxxxxxxxxxxxxxx",
				"usersDatabaseName": usersDatabaseName,
				"operation":         "xxxxxxxxxxxxxxxxxx",
			}).Error("Couldn't change users database password")
		}

		return err
	}

	return err
}
