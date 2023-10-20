-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

-- Create Schema to place tables in
CREATE SCHEMA IF NOT EXISTS "FenixDomainAdministration";

COMMENT ON SCHEMA "FenixDomainAdministration" is 'Holds administrative stuff around domains';

ALTER SCHEMA "FenixDomainAdministration" OWNER TO postgres;

COMMIT;