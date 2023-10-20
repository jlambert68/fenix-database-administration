	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;	

CREATE TABLE IF NOT EXISTS "FenixBuilder"."TestInstructionContainerExecutionTypes"
(
    "TestInstructionContainerExecutionType" varchar not null
        constraint testinstructioncontainerexecutiontypes_pk
            primary key,
    "GrpcMapping"                           integer not null
);

comment on table "FenixBuilder"."TestInstructionContainerExecutionTypes" is 'How a TestInstructionContainer is processed, in serial  or in parallel';

alter table "FenixBuilder"."TestInstructionContainerExecutionTypes"
    owner to postgres;

COMMIT;