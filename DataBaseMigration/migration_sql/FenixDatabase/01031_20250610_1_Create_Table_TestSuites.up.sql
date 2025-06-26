-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixBuilder"."TestSuites"
    "DomainUuid"                                                  uuid      not null,
    "DomainName"                                                  varchar   not null,
    "TestSuiteUuid"                                               uuid      not null,
    "TestSuiteName"                                               varchar   not null,
    "TestSuiteVersion"                                            integer   not null,
    "TestSuiteHash"                                               varchar   not null,
    "CanListAndViewTestSuiteAuthorizationLevelOwnedByDomain"      bigint    not null,
    "CanListAndViewTestSuiteAuthorizationLevelHavingTiAndTicWith" bigint    not null,
    "InsertTimeStamp"                                             timestamp not null,
    "InsertedByUserIdOnComputer"                                  varchar   not null,
    "InsertedByGCPAuthenticatedUser"                              varchar   not null,
    "TestSuiteIsDeleted"                                          boolean   not null,
    "DeleteTimestamp"                                             timestamp default '2068-11-18 00:00:00'::timestamp without time zone,
    "DeletedInsertedTimeStamp"                                    timestamp,
    "DeletedByUserIdOnComputer"                                   varchar,
    "DeletedByGCPAuthenticatedUser"                               varchar,
    "TestCasesInTestSuite"                                        jsonb     not null,
    "TestSuitePreview"                                            jsonb     not null,
    "TestSuiteMetaData"                                           jsonb     not null,
    "TestSuiteTestData"                                           jsonb     not null,
    "TestSuiteImplementedFunctions"                               jsonb     not null,
    "UniqueCounter"                                               serial,
    "TestSuiteType"                                               int8 not null,
    "TestSuiteTypeName"                                           varchar not null,
    "TestSuiteDescription"                                        varchar not null,
    "TestSuiteExecutionEnvironment"                               varchar,
    constraint testsuites_pk
        unique ("TestSuiteUuid", "TestSuiteVersion", "TestSuiteIsDeleted")
);

comment on table "FenixBuilder"."TestSuites" is 'Holds all TestSuites as a JSONB-structure';

alter table "FenixBuilder"."TestSuites"
    owner to postgres;

COMMIT ;





