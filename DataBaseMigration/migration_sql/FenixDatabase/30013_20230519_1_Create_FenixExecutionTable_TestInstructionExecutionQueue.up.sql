-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;


create table "FenixExecution"."TestInstructionExecutionQueue"
(
    "DomainUuid"                        uuid                     not null,
    "DomainName"                        varchar                  not null,
    "TestInstructionExecutionUuid"      uuid                     not null
        primary key,
    "MatureTestInstructionUuid"         uuid                     not null,
    "TestInstructionName"               varchar                  not null,
    "TestInstructionMajorVersionNumber" integer                  not null,
    "TestInstructionMinorVersionNumber" integer                  not null,
    "QueueTimeStamp"                    timestamp with time zone not null,
    "ExecutionPriority"                 integer                  not null
        constraint testinstructionexecutionqueue_executionpriorityenum_priorityid_
            references "FenixExecution"."ExecutionPriorityEnum",
    "TestCaseExecutionUuid"             uuid                     not null,
    "TestDataSetUuid"                   uuid                     not null,
    "TestCaseExecutionVersion"          integer                  not null,
    "TestInstructionExecutionVersion"   integer                  not null,
    "TestInstructionExecutionOrder"     integer                  not null,
    "UniqueCounter"                     serial
        unique,
    "TestInstructionOriginalUuid"       uuid                     not null,
    "ExecutionStatusReportLevel"        integer                  not null
        constraint testinstructionexecutionqueue_executionstatusreportlevelenum_gr
            references "FenixExecution"."ExecutionStatusReportLevelEnum",
    "ExecutionDomainUuid"               uuid                     not null,
    "ExecutionDomainName"               varchar                  not null
);

comment on table "FenixExecution"."TestInstructionExecutionQueue" is 'All TestInstructions to be sent for Execution';

alter table "FenixExecution"."TestInstructionExecutionQueue"
    owner to postgres;

COMMIT;

