-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."TestInstructionsUnderExecution"
(
    "DomainUuid"                                 uuid                     not null,
    "DomainName"                                 varchar                  not null,
    "TestInstructionExecutionUuid"               uuid                     not null
        constraint "SentTestInstructionsForExecution_pkey"
            primary key,
    "TestInstructionUuid"                        uuid                     not null,
    "TestInstructionName"                        varchar                  not null,
    "TestInstructionMajorVersionNumber"          integer                  not null,
    "TestInstructionMinorVersionNumber"          integer                  not null,
    "SentTimeStamp"                              timestamp with time zone not null,
    "ExpectedExecutionDuration"                  timestamp with time zone,
    "ExpectedExecutionEndTimeStamp"              timestamp with time zone,
    "TestInstructionExecutionStatus"             integer                  not null,
    "ExecutionStatusUpdateTimeStamp"             timestamp with time zone not null,
    "TestDataSetUuid"                            uuid                     not null,
    "TestCaseExecutionUuid"                      uuid                     not null,
    "TestCaseExecutionVersion"                   integer                  not null,
    "TestInstructionInstructionExecutionVersion" integer                  not null,
    "TestInstructionCanBeReExecuted"             boolean default true     not null,
    "TestInstructionExecutionOrder"              integer                  not null,
    "UniqueCounter"                              serial
        unique,
    "TestInstructionOriginalUuid"                uuid                     not null,
    "TestInstructionExecutionEndTimeStamp"       timestamp with time zone,
    "TestInstructionExecutionHasFinished"        boolean                  not null,
    "QueueTimeStamp"                             timestamp with time zone,
    "ExecutionPriority"                          integer
);

comment on table "FenixExecution"."TestInstructionsUnderExecution" is 'Holds all TestInstructions sent to client system for execution';

alter table "FenixExecution"."TestInstructionsUnderExecution"
    owner to postgres;

COMMIT;
