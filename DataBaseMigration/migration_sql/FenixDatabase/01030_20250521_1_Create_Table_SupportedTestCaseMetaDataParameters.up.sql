-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixBuilder"."SupportedTestCaseAndTestSuiteMetaData"
(
    "DomainUuid"                uuid    not null
        constraint supportedtestcasemetadata_pk
            primary key
        constraint supportedtestcasemetadata_domains_domain_uuid_fk
            references "FenixDomainAdministration".domains,
    "DomainName"                varchar not null,
    "SupportedTestCaseMetaData" jsonb   not null,
    "UpdateTimeStamp"           timestamp,
    "SupportedTestSuiteMetaData" jsonb   not null
);

comment on table "FenixBuilder"."SupportedTestCaseMetaData" is 'Holds all metadata that can be used for TestCases for each Domain';

alter table "FenixBuilder"."SupportedTestCaseMetaData"
    owner to postgres;

COMMIT ;





