-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixBuilder"."TestSuites"
(
    "DomainUuid"                                                  uuid,
    "DomainName"                                                  varchar,
    "TestSuiteUuid"                                               uuid,
    "TestSuiteName"                                               varchar,
    "TestSuiteVersion"                                            integer,
    "TestSuiteHash"                                               varchar,
    "CanListAndViewTestSuiteAuthorizationLevelOwnedByDomain"      bigint,
    "CanListAndViewTestSuiteAuthorizationLevelHavingTiAndTicWith" bigint,
    "InsertTimeStamp"                                             timestamp,
    "TestSuiteIsDeleted"                                          boolean,
    "DeleteTimestamp"                                             timestamp default '2068-11-18 00:00:00'::timestamp without time zone,
    "DeletedInsertedTImeStamp"                                    timestamp,
    "DeletedByGCPAuthenticatedUser"                               varchar,
    "TestCasesInTestSuite"                                        jsonb   not null,
    "TestSuitePreview"                                            jsonb   not null,
    "TestSuiteMetaData"                                           jsonb   not null,
    "UniqueCounter"                                               serial,
    "DeletedByUserIdOnComputer"                                   varchar not null,
    "InsertedByUserIdOnComputer"                                  varchar not null,
    "InsertedByGCPAuthenticatedUser"                              varchar not null,
    constraint testsuites_pk
        unique ("TestSuiteUuid", "TestSuiteVersion", "TestSuiteIsDeleted")
);

comment on table "FenixBuilder"."TestSuites" is 'Holds all TestSuites as a JSONB-structure';

alter table "FenixBuilder"."TestSuites"
    owner to postgres;

COMMIT ;





