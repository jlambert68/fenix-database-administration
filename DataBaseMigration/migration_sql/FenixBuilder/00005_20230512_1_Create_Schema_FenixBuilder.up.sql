-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

-- Create Schema to place tables in
CREATE SCHEMA IF NOT EXISTS "FenixBuilder";

COMMENT ON SCHEMA "FenixBuilder" is 'Holds all testcases and suites together with metadata to be able to build them';

ALTER SCHEMA "FenixBuilder" OWNER TO postgres;

COMMIT;