-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

-- Create the Domains-table
CREATE TABLE IF NOT EXISTS "FenixDomainAdministration"."domains"
(
    domain_uuid             uuid      not null
        constraint domains_pk
            primary key,
    domain_name             varchar   not null,
    description             varchar,
    activated               boolean   not null,
    deleted                 boolean   not null,
    update_timestamp        timestamp not null,
    replaced_by_new_version boolean   not null,
    domain_id               integer   not null,
    domain_version          integer   not null
);

COMMENT ON TABLE "FenixDomainAdministration".domains is 'Domains that can call Fenix';

ALTER TABLE "FenixDomainAdministration".domains
    OWNER TO "postgres";

COMMIT ;
