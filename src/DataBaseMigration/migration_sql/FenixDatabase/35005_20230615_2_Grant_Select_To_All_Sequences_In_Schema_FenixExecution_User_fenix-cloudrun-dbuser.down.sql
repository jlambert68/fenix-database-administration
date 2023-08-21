-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

REVOKE SELECT ON ALL SEQUENCES IN SCHEMA "FenixExecution" FROM "fenix-cloudrun-dbuser";

COMMIT ;


