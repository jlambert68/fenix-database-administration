-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

REVOKE SELECT ON ALL SEQUENCES IN SCHEMA "FenixDomainAdministration" FROM "fenix-cloudrun-dbuser";

COMMIT ;


