	-- noinspection SqlNoDataSourceInspectionForFile
	
BEGIN;

CREATE TABLE IF NOT EXISTS "FenixBuilder"."BasicTestInstructionInformation"
(
    "DomainUuid"                   uuid      not null,
    "DomainName"                   varchar   not null,
    "TestInstructionUuid"          uuid      not null
        constraint basictestinstructioninformation_pk_2
            primary key,
    "TestInstructionName"          varchar   not null,
    "TestInstructionTypeUuid"      uuid      not null,
    "TestInstructionTypeName"      varchar   not null,
    "Deprecated"                   boolean   not null,
    "MajorVersionNumber"           integer   not null,
    "MinorVersionNumber"           integer   not null,
    "UpdatedTimeStamp"             timestamp not null,
    "TestInstructionColor"         varchar   not null,
    "TCRuleDeletion"               varchar   not null
        constraint basictestinstructioninformation_tcrulesdeletion_deletionrule_fk
            references "FenixBuilder"."TCRulesDeletion",
    "TCRuleSwap"                   varchar   not null
        constraint basictestinstructioninformation_tcruleswap_swaprule_fk
            references "FenixBuilder"."TCRuleSwap",
    "TestInstructionDescription"   varchar   not null,
    "TestInstructionMouseOverText" varchar   not null,
    "Enabled"                      boolean   not null
);

comment on table "FenixBuilder"."BasicTestInstructionInformation" is 'Table  holding Basic information for one TestInstruction';

alter table "FenixBuilder"."BasicTestInstructionInformation"
    owner to postgres;

COMMIT;