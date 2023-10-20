-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA "FenixBuilder" TO "fenix-cloudrun-dbuser";

COMMIT ;
