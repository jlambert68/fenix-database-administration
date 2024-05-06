-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

REVOKE SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA FenixBuilder FROM "fenix-cloudrun-dbuser";

COMMIT ;


