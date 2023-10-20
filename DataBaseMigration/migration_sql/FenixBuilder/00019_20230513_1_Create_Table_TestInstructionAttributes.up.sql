	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;
	
CREATE TABLE IF NOT EXISTS "FenixBuilder"."TestInstructionAttributes"
(
    "DomainUuid"                                    uuid    not null,
    "DomainName"                                    varchar not null,
    "TestInstructionUuid"                           uuid    not null,
    "TestInstructionName"                           varchar not null,
    "TestInstructionAttributeUuid"                  uuid    not null
        unique,
    "TestInstructionAttributeName"                  varchar not null,
    "TestInstructionAttributeDescription"           varchar not null,
    "TestInstructionAttributeMouseOver"             varchar not null,
    "TestInstructionAttributeTypeUuid"              uuid    not null,
    "TestInstructionAttributeTypeName"              varchar not null,
    "TestInstructionAttributeValueAsString"         varchar,
    "TestInstructionAttributeValueUuid"             uuid,
    "TestInstructionAttributeVisible"               boolean not null,
    "TestInstructionAttributeEnabled"               boolean,
    "TestInstructionAttributeMandatory"             boolean,
    "TestInstructionAttributeVisibleInTestCaseArea" boolean,
    "TestInstructionAttributeIsDeprecated"          boolean,
    "TestInstructionAttributeInputMask"             varchar,
    "TestInstructionAttributeType"                  varchar
        constraint testinstructionattributes_testinstructionattributetypes_testins
            references "FenixBuilder"."TestInstructionAttributeTypes"
);

comment on table "FenixBuilder"."TestInstructionAttributes" is 'Holds alla attributes for all TestInstructions';

alter table "FenixBuilder"."TestInstructionAttributes"
    owner to postgres;

COMMIT;