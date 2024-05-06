-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."ExecutionLogPosts"
(
    "DomainUuid"                      uuid      not null,
    "TestCaseExecutionUuid"           uuid      not null,
    "TestCaseExecutionVersion"        integer   not null,
    "TestInstructionExecutionUuid"    uuid      not null,
    "TestInstructionExecutionVersion" integer   not null,
    "TestInstructionExecutionStatus"  integer
        constraint executionlogposts_testcaseexecutionstatusenum_grpc_id_fk
            references "FenixExecution"."TestCaseExecutionStatusEnum",
    "LogPostUuid"                     uuid      not null
        primary key,
    "LogPostTimeStamp"                timestamp not null,
    "LogPostStatus"                   integer
        constraint executionlogposts_logpoststatusenum_grpc_id_fk
            references "FenixExecution"."LogPostStatusEnum",
    "LogPostText"                     varchar,
    "FoundVsExpectedValuesAsJsonb"    jsonb     not null
);

comment on table "FenixExecution"."ExecutionLogPosts" is 'Holds all execution log posts produced by execution clients';

alter table "FenixExecution"."ExecutionLogPosts"
    owner to postgres;


COMMIT;

