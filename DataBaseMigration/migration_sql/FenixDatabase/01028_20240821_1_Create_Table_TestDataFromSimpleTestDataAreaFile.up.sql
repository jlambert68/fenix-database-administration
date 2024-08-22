-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixBuilder"."TestDataFromSimpleTestDataAreaFile"
(
    "TestDataDomainUuid"                               uuid      not null
        constraint testdatafromsimplefile_domains_domain_uuid_fk
            references "FenixDomainAdministration".domains,
    "TestDataDomainName"                               varchar   not null,
    "TestDataDomainTemplateName"                       varchar   not null,
    "TestDataAreaUuid"                                 uuid      not null,
    "TestDataAreaName"                                 varchar   not null,
    "TestDataFileSha256Hash"                           varchar   not null,
    "ImportantDataInFileSha256Hash"                    varchar   not null,
    "InsertedTimeStamp"                                timestamp not null,
    "TestDataFromOneSimpleTestDataAreaFileFullMessage" jsonb     not null,
    constraint testdatafromsimplefile_pk
        primary key ("TestDataDomainUuid", "TestDataAreaUuid")
);

comment on table "FenixBuilder"."TestDataFromSimpleTestDataAreaFile" is 'Holds the testdata sent by Connector. TestData structure is based on the ''Simple'' file structure';

alter table "FenixBuilder"."TestDataFromSimpleTestDataAreaFile"
    owner to postgres;


COMMIT ;





