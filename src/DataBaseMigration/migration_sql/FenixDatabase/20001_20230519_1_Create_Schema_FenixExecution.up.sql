-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

-- Create Schema to place tables in
CREATE SCHEMA IF NOT EXISTS "FenixExecution";

COMMENT ON SCHEMA "FenixExecution" is 'Holds all executions together with execution metadata';

ALTER SCHEMA "FenixExecution" OWNER TO postgres;

COMMIT;