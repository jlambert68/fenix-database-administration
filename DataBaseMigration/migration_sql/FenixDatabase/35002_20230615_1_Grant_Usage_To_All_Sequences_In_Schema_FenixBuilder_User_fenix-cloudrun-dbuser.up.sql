-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

GRANT USAGE ON ALL SEQUENCES IN SCHEMA "FenixBuilder" TO "fenix-cloudrun-dbuser";

COMMIT ;
