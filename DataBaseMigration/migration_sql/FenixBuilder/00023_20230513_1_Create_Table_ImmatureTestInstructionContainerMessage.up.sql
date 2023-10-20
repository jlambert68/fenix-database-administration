	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;
	
CREATE TABLE IF NOT EXISTS "FenixBuilder"."ImmatureTestInstructionContainerMessage"
(
    "DomainUuid"                   uuid    not null,
    "DomainName"                   varchar not null,
    "TestInstructionContainerUuid" uuid    not null
        constraint immaturetestinstructioncontainermessage_pk
            primary key
        constraint immaturetestinstructioncontainermessage_basictestinstructioncon
            references "FenixBuilder"."BasicTestInstructionContainerInformation",
    "TestInstructionContainerName" varchar not null,
    "DropZoneUuid"                 uuid    not null,
    "DropZoneName"                 varchar not null,
    "DropZoneDescription"          varchar not null,
    "DropZoneMouseOver"            varchar not null,
    "DropZoneColor"                varchar not null,
    "TestInstructionAttributeType" varchar not null
        constraint immaturetestinstructioncontainermessage_testinstructionattribut
            references "FenixBuilder"."TestInstructionAttributeTypes",
    "TestInstructionAttributeUuid" uuid    not null,
    "TestInstructionAttributeName" varchar not null,
    "AttributeValueAsString"       varchar not null,
    "AttributeValueUuid"           uuid    not null,
    "FirstImmatureElementUuid"     uuid    not null
);

comment on table "FenixBuilder"."ImmatureTestInstructionContainerMessage" is 'Holding one Immature TestInstruction which is Dragged n Dropped into the TestCase';

alter table "FenixBuilder"."ImmatureTestInstructionContainerMessage"
    owner to postgres;

COMMIT;