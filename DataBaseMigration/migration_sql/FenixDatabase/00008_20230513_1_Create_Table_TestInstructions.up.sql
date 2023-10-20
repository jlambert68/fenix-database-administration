	-- noinspection SqlNoDataSourceInspectionForFile

CREATE TABLE IF NOT EXISTS "FenixBuilder"."TestInstructions"
(
    "DomainUuid"                   uuid      not null
        constraint testinstructions_domains_domain_uuid_fk
            references "FenixDomainAdministration".domains (domain_uuid),
    "DomainName"                   varchar   not null,
    "TestInstructionUuid"          uuid      not null
        constraint testinstructions_pk
            primary key,
    "TestInstructionName"          varchar   not null,
    "TestInstructionTypeUuid"      uuid      not null,
    "TestInstructionTypeName"      varchar   not null,
    "TestInstructionDescription"   varchar   not null,
    "TestInstructionMouseOverText" varchar   not null,
    "Deprecated"                   boolean   not null,
    "Enabled"                      boolean   not null,
    "MajorVersionNumber"           integer   not null,
    "MinorVersionNumber"           integer   not null,
    "UpdatedTimeStamp"             timestamp not null
);

comment on table "FenixBuilder"."TestInstructions" is 'Holds all TestInstructions';

alter table "FenixBuilder"."TestInstructions"
    owner to postgres;
