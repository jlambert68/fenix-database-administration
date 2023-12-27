-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

-- Remove all data in Table "FenixDomainAdministration".SupportedTIAndTICAndAllowedUsers
DELETE FROM "FenixBuilder"."SupportedTIAndTICAndAllowedUsers";

COMMIT;