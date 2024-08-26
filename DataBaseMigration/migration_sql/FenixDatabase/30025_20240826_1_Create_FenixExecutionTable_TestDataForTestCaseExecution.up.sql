-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."TestDataForTestCaseExecution"
(
    "DomainUuid"                          uuid                     not null,
    "DomainName"                          varchar                  not null,
    "TestSuiteUuid"                       uuid,
    "TestSuiteName"                       varchar,
    "TestSuiteVersion"                    integer,
    "TestSuiteExecutionUuid"              uuid                     not null,
    "TestSuiteExecutionVersion"           integer,
    "TestCaseUuid"                        uuid                     not null,
    "TestCaseName"                        varchar                  not null,
    "TestCaseVersion"                     integer                  not null,
    "TestCaseExecutionUuid"               uuid                     not null,
    "TestCaseExecutionVersion"            integer                  not null,
    "InsertedTimeStamp"                   timestamp with time zone not null,
    "TestDataForTestCaseExecutionAsJsonb" jsonb                    not null,
    constraint testdatafortestcaseexecution_pk
        primary key ("TestCaseExecutionUuid", "TestCaseExecutionVersion")
);

comment on table "FenixExecution"."TestDataForTestCaseExecution" is 'Holds TestData for TestCases that will be used for execution';

alter table "FenixExecution"."TestDataForTestCaseExecution"
    owner to postgres;


COMMIT;

