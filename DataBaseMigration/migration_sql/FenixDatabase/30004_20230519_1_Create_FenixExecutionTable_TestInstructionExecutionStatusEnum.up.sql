-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."TestInstructionExecutionStatusEnum"
(
    "gRPC_Id"   integer not null
        primary key,
    "gRPC_Name" varchar not null
        unique
);

comment on table "FenixExecution"."TestInstructionExecutionStatusEnum" is 'Valid execution status for TestInstructions';

alter table "FenixExecution"."TestInstructionExecutionStatusEnum"
    owner to postgres;

COMMIT;
