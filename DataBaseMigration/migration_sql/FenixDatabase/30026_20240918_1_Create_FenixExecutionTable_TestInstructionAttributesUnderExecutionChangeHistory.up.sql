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
    constraint senttestinstructionattributesforexecutionchangehistory_pk
        unique ("TestInstructionExecutionUuid", "TestInstructionAttributeUuid"),
    "TestInstructionExecutionVersion"  integer not null
);

comment on table "FenixExecution"."TestInstructionAttributesUnderExecutionChangeHistory" is 'Holds all change history for attributes that is changed by ExecutionEngine and then sent for execution ';

alter table "FenixExecution"."TestInstructionAttributesUnderExecutionChangeHistory"
    owner to postgres;


COMMIT;

