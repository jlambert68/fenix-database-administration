-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA "FenixExecution" TO "fenix-cloudrun-dbuser";

COMMIT ;
