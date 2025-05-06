-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."TestInstructionAttributesUnderExecution"
(
    "TestInstructionExecutionUuid"     uuid    not null,
    "TestInstructionAttributeType"     integer not null,
    "TestInstructionAttributeUuid"     uuid    not null,
    "TestInstructionAttributeName"     varchar not null,
    "AttributeValueAsString"           varchar,
    "AttributeValueUuid"               uuid,
    "TestInstructionAttributeTypeUuid" uuid    not null,
    "TestInstructionAttributeTypeName" varchar not null,
    "TestInstructionExecutionVersion"  integer,
    "UpdateTimeStamp"                  timestamp with time zone default now(),
    "TestCaseExecutionUuid"            uuid not null,
    "TestInstructionName"              varchar not null,
    "UniqueId"                         serial not null,
    constraint senttestinstructionattributesforexecution_pk
        unique ("TestInstructionExecutionUuid", "TestInstructionAttributeUuid")
);

comment on table "FenixExecution"."TestInstructionAttributesUnderExecution" is 'Holds all attributes that is sent for execution ';

alter table "FenixExecution"."TestInstructionAttributesUnderExecution"
    owner to postgres;

COMMIT;

