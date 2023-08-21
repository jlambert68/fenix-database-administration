-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

REVOKE SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA "FenixExecution" FROM "fenix-cloudrun-dbuser";

COMMIT ;


