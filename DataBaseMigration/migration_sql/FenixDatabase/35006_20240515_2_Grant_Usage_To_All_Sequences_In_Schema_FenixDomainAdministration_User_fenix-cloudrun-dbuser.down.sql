-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

REVOKE USAGE ON ALL SEQUENCES IN SCHEMA "FenixDomainAdministration" FROM "fenix-cloudrun-dbuser";

COMMIT ;


