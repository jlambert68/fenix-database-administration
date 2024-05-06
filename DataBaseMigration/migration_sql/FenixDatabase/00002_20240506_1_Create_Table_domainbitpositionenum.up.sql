-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

-- Create the Domains-table
CREATE TABLE IF NOT EXISTS "FenixDomainAdministration"."domainbitpositionenum"
(
    domain_uuid                                                   uuid      not null
        constraint domains_pk
            primary key,
    domain_name                                                   varchar   not null,
    description                                                   varchar,
    activated                                                     boolean   not null,
    deleted                                                       boolean   not null,
    update_timestamp                                              timestamp not null,
    replaced_by_new_version                                       boolean   not null,
    domain_id                                                     integer   not null,
    domain_version                                                integer   not null,
    workeraddress                                                 varchar   not null
        constraint domains_pk_2
            unique,
    bitnumbername                                                 varchar
        constraint domains_pk_3
            unique
        constraint domains_domainbitpositionenum_bitnumbername_fk
            references domainbitpositionenum,
    "AllUsersCanListAndViewTestCaseHavingTIandTICFromThisDomain"  boolean   not null,
    "AllUsersCanBuildAndSaveTestCaseHavingTIandTICFromThisDomain" boolean   not null
);

comment on table domainbitpositionenum is 'Domains that can call Fenix';

alter table "FenixDomainAdministration".domainbitpositionenum
    owner to postgres;

COMMIT ;

