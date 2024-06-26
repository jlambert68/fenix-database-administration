-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."TestCasesFinishedExecution"
(
    "DomainUuid"                     uuid                     not null,
    "DomainName"                     varchar                  not null,
    "TestSuiteUuid"                  uuid                     not null,
    "TestSuiteName"                  varchar                  not null,
    "TestSuiteVersion"               integer                  not null,
    "TestSuiteExecutionUuid"         uuid                     not null,
    "TestSuiteExecutionVersion"      integer                  not null,
    "TestCaseUuid"                   uuid                     not null,
    "TestCaseName"                   varchar                  not null,
    "TestCaseVersion"                integer                  not null,
    "TestCaseExecutionUuid"          uuid                     not null,
    "TestCaseExecutionVersion"       integer                  not null,
    "QueueTimeStamp"                 timestamp with time zone not null,
    "TestDataSetUuid"                uuid                     not null,
    "ExecutionPriority"              integer                  not null
        constraint testcaseexecutionqueue_executionpriorityenum_priorityid_fk
            references "FenixExecution"."ExecutionPriorityEnum",
    "ExecutionStartTimeStamp"        timestamp with time zone,
    "ExecutionStopTimeStamp"         timestamp with time zone,
    "TestCaseExecutionStatus"        integer
        constraint testcaseexecutionqueue_testcaseexecutionstatusenum_grpc_id_fk
            references "FenixExecution"."TestCaseExecutionStatusEnum",
    "ExecutionHasFinished"           boolean                  not null,
    "UniqueCounter"                  serial
        unique,
    "ExecutionStatusUpdateTimeStamp" timestamp with time zone
);

comment on table "FenixExecution"."TestCasesFinishedExecution" is 'Holds all TestCases that has finished their executions, independent of outcome';

alter table "FenixExecution"."TestCasesFinishedExecution"
    owner to postgres;

COMMIT;

