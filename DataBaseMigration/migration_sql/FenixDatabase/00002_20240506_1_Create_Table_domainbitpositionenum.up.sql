-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

-- Create the Domains-table
CREATE TABLE IF NOT EXISTS "FenixDomainAdministration"."domainbitpositionenum"
(
    bitnumbername  varchar not null
        constraint domainbitpositionenum_pk
            primary key,
    bitnumbervalue bigint
);


alter table "FenixDomainAdministration".domainbitpositionenum
    owner to postgres;

COMMIT ;

