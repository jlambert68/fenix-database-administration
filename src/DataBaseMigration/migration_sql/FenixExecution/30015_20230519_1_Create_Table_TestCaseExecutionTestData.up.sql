-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."TestCaseExecutionTestData"
(
    "TestCaseExecutionUuid"                   uuid    not null,
    "TestDataSetUuid"                         uuid    not null,
    "ManualOverrideTestDataSetAttributeUuid"  uuid    not null,
    "ManualOverrideTestDataSetAttributeName"  varchar not null,
    "ManualOverrideTestDataSetAttributeValue" varchar not null
);

comment on table "FenixExecution"."TestCaseExecutionTestData" is 'Holds the Testdata used for the TestExecution';

alter table "FenixExecution"."TestCaseExecutionTestData"
    owner to postgres;


COMMIT;

