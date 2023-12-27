-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA "FenixDomainAdministration" TO "fenix-cloudrun-dbuser";

COMMIT ;
