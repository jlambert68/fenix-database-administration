-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."TestCaseExecutionStatusEnum"
(
    "gRPC_Id"   integer not null
        primary key
        unique,
    "gRPC_Name" varchar not null
        unique
);

comment on table "FenixExecution"."TestCaseExecutionStatusEnum" is 'Holds all status values for TestCase executions';

alter table "FenixExecution"."TestCaseExecutionStatusEnum"
    owner to postgres;


COMMIT;

