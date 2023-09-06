-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."TestInstructionExecutionMessagesReceivedByWrongExecutionInstanc"
(
    "ApplicationExecutionRuntimeUuid" uuid,
    "TestInstructionExecutionUuid"    uuid      not null,
    "TestInstructionExecutionVersion" integer   not null,
    "TimeStamp"                       timestamp not null,
    "MessageType"                     integer   not null,
    "MessageAsJsonb"                  jsonb     not null
);

comment on table "FenixExecution"."TestInstructionExecutionMessagesReceivedByWrongExecutionInstanc" is 'Temporary holds TestInstructionExecution-data that is handled by other Execution-instance';

alter table "FenixExecution"."TestInstructionExecutionMessagesReceivedByWrongExecutionInstanc"
    owner to postgres;

COMMIT;

