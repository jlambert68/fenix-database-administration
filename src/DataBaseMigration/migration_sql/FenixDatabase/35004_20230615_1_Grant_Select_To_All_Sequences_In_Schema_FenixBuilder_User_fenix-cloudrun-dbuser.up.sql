-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

GRANT SELECT ON ALL SEQUENCES IN SCHEMA "FenixBuilder" TO "fenix-cloudrun-dbuser";

COMMIT ;
