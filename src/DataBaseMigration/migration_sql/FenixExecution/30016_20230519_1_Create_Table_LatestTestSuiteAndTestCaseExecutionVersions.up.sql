-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;



create table "FenixExecution"."LatestTestSuiteAndTestCaseExecutionVersions"
(
    "TestSuiteExecutionUuid"    uuid    not null,
    "TestCaseExecutionUuid"     uuid    not null,
    "TestSuiteExecutionVersion" integer not null,
    "TestCaseExecutionVersion"  integer not null
);

comment on table "FenixExecution"."LatestTestSuiteAndTestCaseExecutionVersions" is 'Holds the latest combination of identity and execution identity';

alter table "FenixExecution"."LatestTestSuiteAndTestCaseExecutionVersions"
    owner to postgres;

COMMIT;

