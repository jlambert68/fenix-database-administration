	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;
	
CREATE TABLE IF NOT EXISTS "FenixBuilder"."ImmatureTestInstructionInformation"
(
    "DomainUuid"                   uuid    not null,
    "DomainName"                   varchar not null,
    "TestInstructionUuid"          uuid    not null
        constraint immaturetestinstructioninformation_basictestinstructioninformat
            references "FenixBuilder"."BasicTestInstructionInformation",
    "TestInstructionName"          varchar not null,
    "DropZoneUuid"                 uuid    not null,
    "DropZoneName"                 varchar not null,
    "DropZoneDescription"          varchar not null,
    "DropZoneMouseOver"            varchar not null,
    "DropZoneColor"                varchar not null,
    "TestInstructionAttributeType" varchar
        constraint immaturetestinstructioninformation_testinstructionattributetype
            references "FenixBuilder"."TestInstructionAttributeTypes",
    "TestInstructionAttributeUuid" uuid,
    "TestInstructionAttributeName" varchar,
    "AttributeValueAsString"       varchar,
    "AttributeValueUuid"           uuid,
    "FirstImmatureElementUuid"     uuid    not null,
    "AttributeActionCommand"       integer not null
        constraint immaturetestinstructioninformation_attributeactioncommandenum_g
            references "FenixBuilder"."AttributeActionCommandEnum",
    constraint immaturetestinstructioninformation_pk
        unique ("TestInstructionUuid", "DropZoneUuid", "AttributeValueUuid")
);

comment on table "FenixBuilder"."ImmatureTestInstructionInformation" is 'Holding the information about the Immature TestInstruction';

alter table "FenixBuilder"."ImmatureTestInstructionInformation"
    owner to postgres;

COMMIT;