-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

REVOKE USAGE ON ALL SEQUENCES IN SCHEMA "FenixExecution" FROM "fenix-cloudrun-dbuser";

COMMIT ;


