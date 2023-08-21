-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;



create table "FenixExecution"."TestCaseExecutionQueue"
(
    "DomainUuid"                uuid                     not null,
    "DomainName"                varchar                  not null,
    "TestSuiteUuid"             uuid,
    "TestSuiteName"             varchar,
    "TestSuiteVersion"          integer,
    "TestSuiteExecutionUuid"    uuid                     not null,
    "TestSuiteExecutionVersion" integer,
    "TestCaseUuid"              uuid                     not null,
    "TestCaseName"              varchar                  not null,
    "TestCaseVersion"           integer                  not null,
    "TestCaseExecutionUuid"     uuid                     not null,
    "TestCaseExecutionVersion"  integer                  not null,
    "QueueTimeStamp"            timestamp with time zone not null,
    "TestDataSetUuid"           uuid                     not null,
    "ExecutionPriority"         integer                  not null
        constraint testcaseexecutionqueue_executionpriorityenum_priorityid_fk
            references "FenixExecution"."ExecutionPriorityEnum",
    "UniqueCounter"             serial
        unique
);

comment on table "FenixExecution"."TestCaseExecutionQueue" is 'Holds TestCases that are waiting to be executed execution';

alter table "FenixExecution"."TestCaseExecutionQueue"
    owner to postgres;

COMMIT;

