	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;
	
CREATE TABLE IF NOT EXISTS "FenixBuilder"."TestInstructionAttributeTypes"
(
    "TestInstructionAttributeType" varchar not null
        constraint testinstructionattributetypes_pk
            primary key
);

comment on table "FenixBuilder"."TestInstructionAttributeTypes" is 'The TestInstructionAttribute can have one of the following types: \"TextBox\", \"ComboBox\", \"FileSelector\", \"FunctionSelector\"';

alter table "FenixBuilder"."TestInstructionAttributeTypes"
    owner to postgres;

COMMIT;