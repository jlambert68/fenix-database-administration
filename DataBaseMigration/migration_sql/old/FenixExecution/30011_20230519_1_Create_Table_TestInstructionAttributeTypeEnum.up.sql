-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;


create table "FenixExecution"."TestInstructionAttributeTypeEnum"
(
    "gRPC_Id"   integer not null
        unique,
    "gRPC_Name" varchar not null
        unique
);

comment on table "FenixExecution"."TestInstructionAttributeTypeEnum" is 'Holds the types of attributes that is supported';

alter table "FenixExecution"."TestInstructionAttributeTypeEnum"
    owner to postgres;


COMMIT;

