package DatabasePasswordChanger

import (
	SharedCode2 "fenix-database-administration/SharedCode"
	uuidGenerator "github.com/google/uuid"
	"github.com/sirupsen/logrus"
	"os"
)

func UpdateUsersDatabasePassword(
	project string,
	databaseInstance string,
	secretManagerPath string,
	secretVersion string,
	databaseUserName string) {

	SharedCode2.Logger.WithFields(logrus.Fields{
		"Id":                "2a70d9e4-2ac2-46d1-9c88-b33b99d48ca9",
		"project":           project,
		"databaseInstance":  databaseInstance,
		"secretManagerPath": secretManagerPath,
		"secretVersion":     secretVersion,
		"databaseUserName":  databaseUserName,
	}).Info("Entering - updateUsersDatabasePassword")

	defer SharedCode2.Logger.WithFields(logrus.Fields{
		"Id": "5d6f2466-dc40-4b55-b715-1a96e92960c3",
	}).Info("Exiting - updateUsersDatabasePassword")

	// Check if database password should be updated or not
	switch SharedCode2.ExecutionEnvironment {
	case SharedCode2.DEV:
		if SharedCode2.UpdatePasswordInDevEnvironment == false {

			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                              "b89a7962-7d7e-45b6-86b7-d818881d8b2d",
				"SharedCode.ExecutionEnvironment": SharedCode2.ExecutionEnvironment,
				"databaseUserName":                databaseUserName,
			}).Info("Database password will not be updated in the Development environment")

			return
		}

	case SharedCode2.ACC:
		if SharedCode2.UpdatePasswordInAccEnvironment == false {

			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                              "bd35f170-b623-4f00-8b44-d62e698dc665",
				"SharedCode.ExecutionEnvironment": SharedCode2.ExecutionEnvironment,
				"databaseUserName":                databaseUserName,
			}).Info("Database password will not be updated in the Acceptance environment")

			return
		}

	default:
		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":                              "a4e45ac5-678b-4c76-8d8d-589bcee553c5",
			"SharedCode.ExecutionEnvironment": SharedCode2.ExecutionEnvironment,
		}).Error("Unknown environment")

		return
	}

	var err error
	var errFirstPassword error

	// Load current stored secret from Secret Manager
	var previousPasswordFromSecretManager string
	var firstPasswordFromSecretManager string
	previousPasswordFromSecretManager, err = SharedCode2.AccessSecretVersion(secretManagerPath + secretVersion)

	firstPasswordFromSecretManager, errFirstPassword = SharedCode2.AccessSecretVersion(secretManagerPath + SharedCode2.LatestSecretVersion)
	// Verify that user can log in to database with new password
	_ = ConnectToDB(databaseUserName, firstPasswordFromSecretManager, SharedCode2.DBNameToTarget)
	dbPool.Close()

	// Can't handle the latest secret when it's the first one
	if err != nil {

		// Only log passwords in DEV-environment
		if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                                "9b278425-1937-4c2b-a636-b2391cc31bff",
				"err":                               err,
				"secretManagerPath+version":         secretManagerPath + secretVersion,
				"previousPasswordFromSecretManager": previousPasswordFromSecretManager,
			}).Error("Problem when reading the latest secret from Secret Manager. Try to read first Secret")
		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                                "736e389c-0569-4076-bbca-0fec0bd59328",
				"err":                               err,
				"secretManagerPath+version":         secretManagerPath + secretVersion,
				"previousPasswordFromSecretManager": "xxxxxxxxxxxxxxxxxx",
			}).Error("Problem when reading the latest secret from Secret Manager. Try to read first Secret")
		}

		firstPasswordFromSecretManager, errFirstPassword = SharedCode2.AccessSecretVersion(secretManagerPath + SharedCode2.FirstSecretVersion)

		if errFirstPassword != nil {

			// Only log passwords in DEV-environment
			if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
				SharedCode2.Logger.WithFields(logrus.Fields{
					"Id":               "0bbd3bde-3a31-4469-a1a2-3150d74bcf05",
					"err":              err,
					"errFirstPassword": errFirstPassword,
					"secretManagerPath+SharedCode.FirstSecretVersion": secretManagerPath + SharedCode2.FirstSecretVersion,
					"previousPasswordFromSecretManager":               previousPasswordFromSecretManager,
					"firstPasswordFromSecretManager":                  firstPasswordFromSecretManager,
				}).Error("Problem when reading the first secret from Secret Manager")

			} else {
				SharedCode2.Logger.WithFields(logrus.Fields{
					"Id":               "09e7d7ae-529a-45ca-a8c2-c3dc5ab9077b",
					"err":              err,
					"errFirstPassword": errFirstPassword,
					"secretManagerPath+SharedCode.FirstSecretVersion": secretManagerPath + SharedCode2.FirstSecretVersion,
					"previousPasswordFromSecretManager":               "xxxxxxxxxxxxxxxxxx",
					"firstPasswordFromSecretManager":                  "xxxxxxxxxxxxxxxxxx",
				}).Error("Problem when reading the first secret from Secret Manager")
			}
			// Exit application
			os.Exit(1)

		} else {

			previousPasswordFromSecretManager = firstPasswordFromSecretManager

			// Only log passwords in DEV-environment
			if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
				SharedCode2.Logger.WithFields(logrus.Fields{
					"Id":                             "66a57c65-db44-44fa-9ad6-1309482a7ef2",
					"secretManagerPath+version":      secretManagerPath + secretVersion,
					"firstPasswordFromSecretManager": firstPasswordFromSecretManager,
				}).Debug("Success in reading the latest secret in Secret Manager for user")

			} else {
				SharedCode2.Logger.WithFields(logrus.Fields{
					"Id":                             "79ef0c99-b141-4af4-83ce-92421caf95c9",
					"secretManagerPath+version":      secretManagerPath + secretVersion,
					"firstPasswordFromSecretManager": "xxxxxxxxxxxxxxxxxx",
				}).Debug("Success in reading the latest secret in Secret Manager for user")
			}
		}
	} else {

		// Only log passwords in DEV-environment
		if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                                "acbb3e84-60ed-4a90-ac1e-359ac0753019",
				"secretManagerPath+version":         secretManagerPath + secretVersion,
				"previousPasswordFromSecretManager": previousPasswordFromSecretManager,
			}).Debug("Success in reading the latest secret in Secret Manager for user")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                                "36fa42b3-6d95-4f3a-a871-49a8ce46aded",
				"secretManagerPath+version":         secretManagerPath + secretVersion,
				"previousPasswordFromSecretManager": "xxxxxxxxxxxxxxxxxx",
			}).Debug("Success in reading the latest secret in Secret Manager for user")
		}
	}

	// Verify that user can log in to database with new password
	_ = ConnectToDB(databaseUserName, previousPasswordFromSecretManager, SharedCode2.DBNameToTarget)
	dbPool.Close()

	// Generate new secret password for Database user
	var newDatabasePassword string
	newDatabasePassword = uuidGenerator.New().String()

	// Only log passwords in DEV-environment
	if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":                  "a415c95b-7271-4590-9035-71e57d23b3d4",
			"newDatabasePassword": newDatabasePassword,
		}).Debug("New password created")

	} else {

		SharedCode2.Logger.WithFields(logrus.Fields{
			"Id":                  "3045240d-03c3-4645-b553-1a4ece25d3fb",
			"newDatabasePassword": "xxxxxxxxxxxxxxxxxx",
		}).Debug("New password created")
	}

	// Add new Password to Secret Manager for Database User
	var secretVersionName string
	secretVersionName, err = SharedCode2.AddSecretVersion(secretManagerPath, newDatabasePassword)
	if err != nil {

		// Only log passwords in DEV-environment
		if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                  "00590b5e-0f73-4c65-999c-e2f268253504",
				"err":                 err,
				"secretManagerPath":   secretManagerPath,
				"newDatabasePassword": newDatabasePassword,
				"secretVersionName":   secretVersionName,
			}).Error("Couldn't add Secret to Secret Manager for user")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                  "b9320b66-d115-4309-934f-cbff90b46191",
				"err":                 err,
				"secretManagerPath":   secretManagerPath,
				"newDatabasePassword": "xxxxxxxxxxxxxxxxxx",
				"secretVersionName":   secretVersionName,
			}).Error("Couldn't add Secret to Secret Manager for user")

		}

		// Exit application
		os.Exit(1)

	} else {

		// Only log passwords in DEV-environment
		if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                  "d094a152-9c11-423c-995c-ac3bf62acf67",
				"secretManagerPath":   secretManagerPath,
				"newDatabasePassword": newDatabasePassword,
				"secretVersionName":   secretVersionName,
			}).Debug("Success in storing secret in Secret Manager for user'")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                  "b8493769-025e-4291-b058-b770227fbda4",
				"secretManagerPath":   secretManagerPath,
				"newDatabasePassword": "xxxxxxxxxxxxxxxxxx",
				"secretVersionName":   secretVersionName,
			}).Debug("Success in storing secret in Secret Manager for user'")
		}
	}

	// Load newly stored secret from Secret Manager
	var passwordFromSecretManager string
	passwordFromSecretManager, err = SharedCode2.AccessSecretVersion(secretManagerPath + secretVersion)
	if err != nil {

		// Only log passwords in DEV-environment
		if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                        "56372036-0330-423f-8502-af408d2e5b9d",
				"err":                       err,
				"secretManagerPath+version": secretManagerPath + secretVersion,
				"passwordFromSecretManager": passwordFromSecretManager,
			}).Error("Problem when reading the latest secret from Secret Manager")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                        "85ec50b6-c65a-449d-824e-39d1a96d020a",
				"err":                       err,
				"secretManagerPath+version": secretManagerPath + secretVersion,
				"passwordFromSecretManager": "xxxxxxxxxxxxxxxxxx",
			}).Error("Problem when reading the latest secret from Secret Manager")
		}

		// Exit application
		os.Exit(1)

	} else {

		// Only log passwords in DEV-environment
		if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                        "cab6ecca-429d-4240-ad97-0b3f40c2bc58",
				"secretManagerPath+version": secretManagerPath + secretVersion,
				"passwordFromSecretManager": passwordFromSecretManager,
			}).Debug("Success in reading secret in Secret Manager for user")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                        "40e64e67-3956-4490-845d-0e823191bca0",
				"secretManagerPath+version": secretManagerPath + secretVersion,
				"passwordFromSecretManager": "xxxxxxxxxxxxxxxxxx",
			}).Debug("Success in reading secret in Secret Manager for user")
		}
	}

	// Change Database password in database for user
	err = updateUsersCloudSQLPassword(
		project,
		databaseInstance,
		databaseUserName,
		[]byte(passwordFromSecretManager))

	if err != nil {

		// Only log passwords in DEV-environment
		if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                        "e4d7ca38-aaa3-4457-89f3-33da9bfb83c9",
				"err":                       err,
				"project":                   project,
				"databaseInstance":          databaseInstance,
				"databaseUserName":          databaseUserName,
				"passwordFromSecretManager": passwordFromSecretManager,
			}).Error("Error, when trying to change password in database")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                        "820d9850-62bc-4fab-bba1-1ca81eae4d2c",
				"err":                       err,
				"project":                   project,
				"databaseInstance":          databaseInstance,
				"databaseUserName":          databaseUserName,
				"passwordFromSecretManager": "xxxxxxxxxxxxxxxxxx",
			}).Error("Error, when trying to change password in database")
		}

		// Add new previous password as latest to Secret Manager for Database User
		var secretVersionNameForPreviousPassword string
		secretVersionNameForPreviousPassword, err = SharedCode2.AddSecretVersion(secretManagerPath, previousPasswordFromSecretManager)
		if err != nil {

			// Only log passwords in DEV-environment
			if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
				SharedCode2.Logger.WithFields(logrus.Fields{
					"Id":                                   "00590b5e-0f73-4c65-999c-e2f268253504",
					"err":                                  err,
					"secretManagerPath":                    secretManagerPath,
					"previousPasswordFromSecretManager":    previousPasswordFromSecretManager,
					"secretVersionNameForPreviousPassword": secretVersionNameForPreviousPassword,
				}).Error("Couldn't add Secret to Secret Manager for user")

			} else {
				SharedCode2.Logger.WithFields(logrus.Fields{
					"Id":                                   "be8ff2f1-b051-483e-8270-14e449106205",
					"err":                                  err,
					"secretManagerPath":                    secretManagerPath,
					"previousPasswordFromSecretManager":    "xxxxxxxxxxxxxxxxxx",
					"secretVersionNameForPreviousPassword": secretVersionNameForPreviousPassword,
				}).Error("Couldn't add Secret to Secret Manager for user")
			}

			// Exit application
			os.Exit(1)

		} else {

			// Only log passwords in DEV-environment
			if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
				SharedCode2.Logger.WithFields(logrus.Fields{
					"Id":                                   "d094a152-9c11-423c-995c-ac3bf62acf67",
					"previousPasswordFromSecretManager":    previousPasswordFromSecretManager,
					"secretVersionNameForPreviousPassword": secretVersionNameForPreviousPassword,
				}).Debug("Success in storing previous secret as latest in Secret Manager for user'")

			} else {
				SharedCode2.Logger.WithFields(logrus.Fields{
					"Id":                                   "0060a227-853a-4b96-8b19-30ca06728632",
					"previousPasswordFromSecretManager":    "xxxxxxxxxxxxxxxxxx",
					"secretVersionNameForPreviousPassword": secretVersionNameForPreviousPassword,
				}).Debug("Success in storing previous secret as latest in Secret Manager for user'")
			}
		}

		// Destroy the newly stored Secret
		err = SharedCode2.DestroySecretVersion(secretVersionName)

		if err != nil {

			// Only log passwords in DEV-environment
			if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
				SharedCode2.Logger.WithFields(logrus.Fields{
					"Id":                        "0f0e9ebf-3b55-4be3-a0ee-5fe8c163f6af",
					"err":                       err,
					"passwordFromSecretManager": passwordFromSecretManager,
					"secretVersionName":         secretVersionName,
				}).Error("Couldn't destroy secret in Secret Manager")

			} else {
				SharedCode2.Logger.WithFields(logrus.Fields{
					"Id":                        "13fd9874-b820-4fc9-b403-d6477bc5c372",
					"err":                       err,
					"passwordFromSecretManager": "xxxxxxxxxxxxxxxxxx",
					"secretVersionName":         secretVersionName,
				}).Error("Couldn't destroy secret in Secret Manager")
			}

		} else {

			// Only log passwords in DEV-environment
			if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
				SharedCode2.Logger.WithFields(logrus.Fields{
					"Id":                        "9cb41de9-5feb-40ea-a169-1b92dd6e3c51",
					"passwordFromSecretManager": passwordFromSecretManager,
					"secretVersionName":         secretVersionName,
				}).Debug("Success in destroying secret in Secret Manager")

			} else {
				SharedCode2.Logger.WithFields(logrus.Fields{
					"Id":                        "ecd61664-67bb-466b-b1e3-8772d60f292a",
					"passwordFromSecretManager": "xxxxxxxxxxxxxxxxxx",
					"secretVersionName":         secretVersionName,
				}).Debug("Success in destroying secret in Secret Manager")

			}
		}

		// Exit application
		os.Exit(1)

	} else {

		// Only log passwords in DEV-environment
		if SharedCode2.ExecutionEnvironment == SharedCode2.DEV {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                        "225b133f-ecff-4b44-94bb-b9e32936ad90",
				"project":                   project,
				"databaseInstance":          databaseInstance,
				"databaseUserName":          databaseUserName,
				"passwordFromSecretManager": passwordFromSecretManager,
			}).Debug("Success in changing database password for user")

		} else {
			SharedCode2.Logger.WithFields(logrus.Fields{
				"Id":                        "c19e955a-ed51-4d2c-9600-3f613f51438e",
				"project":                   project,
				"databaseInstance":          databaseInstance,
				"databaseUserName":          databaseUserName,
				"passwordFromSecretManager": "xxxxxxxxxxxxxxxxxx",
			}).Debug("Success in changing database password for user")
		}
	}

	// Verify that user can log in to database with new password
	_ = ConnectToDB(databaseUserName, passwordFromSecretManager, SharedCode2.DBNameToTarget) //passwordFromSecretManager)
	dbPool.Close()

}
