-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

REVOKE SELECT ON ALL SEQUENCES IN SCHEMA "FenixBuilder" FROM "fenix-cloudrun-dbuser";

COMMIT ;


