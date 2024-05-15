-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

GRANT SELECT ON ALL SEQUENCES IN SCHEMA "FenixDomainAdministration" TO "fenix-cloudrun-dbuser";

COMMIT ;
