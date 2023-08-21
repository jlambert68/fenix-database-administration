	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;
	
CREATE TABLE IF NOT EXISTS "FenixBuilder"."ImmatureElementModelMessage"
(
    "DomainUuid"               uuid    not null,
    "DomainName"               varchar not null,
    "ImmatureElementUuid"      uuid    not null,
    "ImmatureElementName"      varchar not null,
    "PreviousElementUuid"      uuid    not null,
    "NextElementUuid"          uuid    not null,
    "FirstChildElementUuid"    uuid    not null,
    "ParentElementUuid"        uuid    not null,
    "TestCaseModelElementType" varchar not null
        constraint immatureelementmodelmessage_testcasemodelelementtypes_testcasem
            references "FenixBuilder"."TestCaseModelElementTypes",
    "OriginalElementUuid"      uuid    not null,
    "TopImmatureElementUuid"   uuid    not null,
    "IsTopElement"             boolean not null
);

comment on table "FenixBuilder"."ImmatureElementModelMessage" is 'Holding the model for Immature elements, e.g. TestInstructions and pre-created TestInstructionContainers';

alter table "FenixBuilder"."ImmatureElementModelMessage"
    owner to postgres;

COMMIT;