	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;
	
CREATE TABLE IF NOT EXISTS "FenixBuilder"."TestContainerChildType"
(
    "TestInstructionContainerChildType"        integer not null
        constraint testcontainerchildtype_pk
            unique,
    "TestInstructionContainerChildDescription" varchar not null
);

comment on table "FenixBuilder"."TestContainerChildType" is 'Holds the different child-types that a TestInstructionContainer can have';

alter table "FenixBuilder"."TestContainerChildType"
    owner to postgres;

COMMIT;