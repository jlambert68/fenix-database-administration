-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."TestSuitesExecutionsForListings"
(
    "DomainUuid"                                   uuid                      not null,
    "DomainName"                                   varchar                   not null,
    "TestSuiteUuid"                                uuid                      not null,
    "TestSuiteName"                                varchar                   not null,
    "TestSuiteVersion"                             integer                   not null,
    "TestSuiteExecutionUuid"                       uuid                      not null,
    "TestSuiteExecutionVersion"                    integer                   not null,
    "UpdatingTestCaseUuid"                         uuid                      not null,
    "UpdatingTestCaseName"                         varchar                   not null,
    "UpdatingTestCaseVersion"                      integer                   not null,
    "UpdatingTestCaseExecutionUuid"                uuid                      not null,
    "UpdatingTestCaseExecutionVersion"             integer                   not null,
    "QueueTimeStamp"                               timestamp with time zone  not null,
    "TestDataSetUuid"                              uuid                      not null,
    "ExecutionPriority"                            integer                   not null
        constraint testsuiteexecutionqueue_executionpriorityenum_priorityid_fk
            references "FenixExecution"."ExecutionPriorityEnum",
    "ExecutionStartTimeStamp"                      timestamp with time zone,
    "ExecutionStopTimeStamp"                       timestamp with time zone,
    "TestSuiteExecutionStatus"                     integer
        constraint testsuiteexecutionqueue_testsuiteexecutionstatusenum_grpc_id_fk
            references "FenixExecution"."TestSuiteExecutionStatusEnum",
    "ExecutionHasFinished"                         boolean                   not null,
    "UniqueCounter"                                serial
        unique,
    "ExecutionStatusUpdateTimeStamp"               timestamp with time zone,
    "ExecutionStatusReportLevel"                   integer                   not null
        constraint testsuitesunderexecution_executionstatusreportlevelenum_grpc_id
            references "FenixExecution"."ExecutionStatusReportLevelEnum",
    "TestSuitePreview"                             jsonb default '{}'::jsonb not null,
    "TestInstructionsExecutionStatusPreviewValues" jsonb default '{}'::jsonb not null,
    "UniqueExecutionCounter"                       serial
        unique,
    "TestCasesPreview"                             jsonb default '{}'::jsonb not null
);

comment on table "FenixExecution"."TestSuitesExecutionsForListings" is 'Holds data for TestSuiteExecutions. This data is used in list of executions';

alter table "FenixExecution"."TestSuitesExecutionsForListings"
    owner to postgres;


COMMIT;

