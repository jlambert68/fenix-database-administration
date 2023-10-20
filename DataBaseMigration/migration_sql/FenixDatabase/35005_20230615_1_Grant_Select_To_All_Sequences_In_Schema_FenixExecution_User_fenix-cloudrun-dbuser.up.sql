-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

GRANT SELECT ON ALL SEQUENCES IN SCHEMA "FenixExecution" TO "fenix-cloudrun-dbuser";

COMMIT ;
