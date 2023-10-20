-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

REVOKE USAGE ON ALL SEQUENCES IN SCHEMA "FenixBuilder" FROM "fenix-cloudrun-dbuser";

COMMIT ;


