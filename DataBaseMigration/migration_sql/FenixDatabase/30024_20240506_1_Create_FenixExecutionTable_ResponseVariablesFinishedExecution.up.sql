-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;



create table "FenixExecution"."ResponseVariablesFinishedExecution"
(
    "Identifier"                      uuid      not null
        constraint responsevariablesfinishedexecution_pk
            primary key,
    "UniqueRowCounter"                serial,
    "TestInstructionExecutionUuid"    uuid      not null,
    "TestInstructionExecutionVersion" integer   not null,
    "ResponseVariableUuid"            uuid      not null,
    "ResponseVariableName"            varchar   not null,
    "ResponseVariableTypeUuid"        uuid      not null,
    "ResponseVariableTypeName"        varchar   not null,
    "ResponseVariableValueAsString"   varchar,
    "InsertedTimeStamp"               timestamp not null
);

alter table "FenixExecution"."ResponseVariablesFinishedExecution"
    owner to postgres;

COMMIT;

