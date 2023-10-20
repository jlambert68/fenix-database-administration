-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

GRANT USAGE ON ALL SEQUENCES IN SCHEMA "FenixExecution" TO "fenix-cloudrun-dbuser";

COMMIT ;
