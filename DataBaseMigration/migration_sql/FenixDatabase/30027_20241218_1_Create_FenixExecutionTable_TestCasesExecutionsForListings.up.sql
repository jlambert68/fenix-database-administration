-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table if not exists "FenixExecution"."TestCasesExecutionsForListings"
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
    "ExecutionStatusUpdateTimeStamp" timestamp with time zone,
    "ExecutionStatusReportLevel"     integer                  not null
        constraint testcasesunderexecution_executionstatusreportlevelenum_grpc_id_
            references "FenixExecution"."ExecutionStatusReportLevelEnum",
    "TestCasePreview" jsonb not null,
    "ExecutionStatusPreviewValue" jsonb not null,
    "UniqueExecutionCounter"                 serial
        unique
);


comment on table "FenixExecution"."TestCasesExecutionsForListings" is 'Holds data for TestCaseExecutions. This data is used in list of executions';

alter table "FenixExecution"."TestCasesExecutionsForListings"
    owner to postgres;


COMMIT;

