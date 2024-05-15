-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

GRANT USAGE ON ALL SEQUENCES IN SCHEMA "FenixDomainAdministration" TO "fenix-cloudrun-dbuser";

COMMIT ;
