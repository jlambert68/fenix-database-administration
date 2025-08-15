-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."TestSuiteExecutionStatusEnum"
(
    "gRPC_Id"   integer not null
        primary key,
    "gRPC_Name" varchar not null
        unique
);

comment on table "FenixExecution"."TestSuiteExecutionStatusEnum" is 'Holds all status values for TestSuite executions';

alter table "FenixExecution"."TestSuiteExecutionStatusEnum"
    owner to postgres;

COMMIT;
