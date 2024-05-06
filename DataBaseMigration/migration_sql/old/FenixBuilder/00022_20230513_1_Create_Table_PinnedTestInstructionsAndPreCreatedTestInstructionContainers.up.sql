	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;
	
CREATE TABLE IF NOT EXISTS "FenixBuilder"."PinnedTestInstructionsAndPreCreatedTestInstructionContainers"
(
    "UserId"     varchar   not null,
    "PinnedUuid" uuid      not null,
    "PinnedName" varchar   not null,
    "PinnedType" integer   not null
        constraint pinnedtestinstructionsandprecreatedtestinstructioncontainers_te
            references "FenixBuilder"."TestContainerChildType" ("TestInstructionContainerChildType"),
    "TimeStamp"  timestamp not null,
    constraint pinnedtestinstructionsandprecreatedtestinstructioncontainers_pk
        unique ("UserId", "PinnedUuid")
);

comment on table "FenixBuilder"."PinnedTestInstructionsAndPreCreatedTestInstructionContainers" is 'Holds all users pinned TestInstructions ans pre-created TestInstructionsContainers';

alter table "FenixBuilder"."PinnedTestInstructionsAndPreCreatedTestInstructionContainers"
    owner to postgres;

COMMIT;
