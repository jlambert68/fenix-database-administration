	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;
	
CREATE TABLE IF NOT EXISTS "FenixBuilder"."TestInstructionContainerChildren"
(
    "TestIntructionContainer" uuid    not null
        constraint testinstructioncontainerchildren_testinstructioncontainercontai
            references "FenixBuilder"."TestInstructionContainers",
    "TestContainerChildUuid"  uuid    not null,
    "TestContainerChildType"  integer not null
        constraint testinstructioncontainerchildren_testcontainerchildtype_testins
            references "FenixBuilder"."TestContainerChildType" ("TestInstructionContainerChildType")
);

comment on table "FenixBuilder"."TestInstructionContainerChildren" is 'Holds the releation between a TestIntructionContainer and it''s children';

alter table "FenixBuilder"."TestInstructionContainerChildren"
    owner to postgres;

COMMIT;