-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

-- Remove all data in Table "FenixDomainAdministration".domains
DELETE FROM "FenixDomainAdministration"."allowedusers";

COMMIT;