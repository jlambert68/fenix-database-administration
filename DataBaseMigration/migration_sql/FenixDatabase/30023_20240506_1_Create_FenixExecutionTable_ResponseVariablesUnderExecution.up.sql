-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;



create table "FenixExecution"."ResponseVariablesUnderExecution"
(
    "UniqueUuid"                      uuid      not null
        constraint responsevariablesunderexecution_pk
            primary key,
    "DomainUuid"                      uuid      not null,
    "TestCaseExecutionUuid"           uuid      not null,
    "TestCaseExecutionVersion"        integer   not null,
    "TestInstructionExecutionUuid"    uuid      not null,
    "TestInstructionExecutionVersion" integer   not null,
    "ResponseVariableUuid"            uuid      not null,
    "ResponseVariableName"            varchar   not null,
    "ResponseVariableTypeUuid"        uuid      not null,
    "ResponseVariableTypeName"        varchar   not null,
    "ResponseVariableValueAsString"   varchar   not null,
    "InsertedTimeStamp"               timestamp not null,
    "MatureTestInstructionUuid"       uuid      not null
);

alter table "FenixExecution"."ResponseVariablesUnderExecution"
    owner to postgres;

COMMIT;

