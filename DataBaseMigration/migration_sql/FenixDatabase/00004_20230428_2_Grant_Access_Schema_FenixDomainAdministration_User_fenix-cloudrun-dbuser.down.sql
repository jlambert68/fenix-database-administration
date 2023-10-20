-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

REVOKE SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA "FenixDomainAdministration" FROM "fenix-cloudrun-dbuser";

COMMIT ;


