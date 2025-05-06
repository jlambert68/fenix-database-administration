-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."TestInstructionAttributesUnderExecutionChangeHistory"
(
    "TestInstructionExecutionUuid"     uuid    not null,
    "TestInstructionAttributeType"     integer not null,
    "TestInstructionAttributeUuid"     uuid    not null,
    "TestInstructionAttributeName"     varchar not null,
    "AttributeValueAsString"           varchar,
    "AttributeValueUuid"               uuid,
    "TestInstructionAttributeTypeUuid" uuid    not null,
    "TestInstructionAttributeTypeName" varchar not null,
    "TestInstructionExecutionVersion"  integer not null,
    "UpdateTimeStamp"                  timestamp with time zone default now(),
    "TestCaseExecutionUuid"            uuid not null,
    "TestInstructionName"              varchar not null,
    "UniqueId"                         integer not null,
    "UniqueId_New"                     serial not null
);

comment on table "FenixExecution"."TestInstructionAttributesUnderExecutionChangeHistory" is 'Holds all change history for attributes that is changed by ExecutionEngine and then sent for execution ';

alter table "FenixExecution"."TestInstructionAttributesUnderExecutionChangeHistory"
    owner to postgres;


COMMIT;



