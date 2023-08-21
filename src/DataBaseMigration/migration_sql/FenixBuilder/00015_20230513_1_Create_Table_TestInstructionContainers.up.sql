	-- noinspection SqlNoDataSourceInspectionForFile
	
BEGIN;

CREATE TABLE IF NOT EXISTS "FenixBuilder"."TestInstructionContainers"
(
    "DomainUuid"                            uuid      not null,
    "DomainName"                            varchar   not null,
    "TestInstructionContainerUuid"          uuid      not null
        constraint testinstructioncontainers_pk
            primary key,
    "TestInstructionContainerName"          varchar   not null,
    "TestInstructionContainerTypeUuid"      uuid      not null,
    "TestInstructionContainerTypeName"      varchar   not null,
    "TestInstructionContainerDescription"   varchar   not null,
    "TestInstructionContainerMouseOverText" varchar   not null,
    "Deprecated"                            boolean   not null,
    "Enabled"                               boolean   not null,
    "MajorVersionNumber"                    integer   not null,
    "MinorVersionNumber"                    integer   not null,
    "UpdatedTimeStamp"                      timestamp not null,
    "ChildrenIsParallelProcessed"           boolean   not null
);

alter table "FenixBuilder"."TestInstructionContainers"
    owner to postgres;

COMMIT;