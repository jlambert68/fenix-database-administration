	-- noinspection SqlNoDataSourceInspectionForFile
	
BEGIN;
	
CREATE TABLE IF NOT EXISTS "FenixBuilder"."BasicTestInstructionContainerInformation"
(
    "DomainUuid"                            uuid      not null,
    "DomainName"                            varchar   not null,
    "TestInstructionContainerUuid"          uuid      not null
        constraint basictestinstructioncontainerinformation_pk
            primary key,
    "TestInstructionContainerName"          varchar   not null,
    "TestInstructionContainerTypeUuid"      uuid      not null,
    "TestInstructionContainerTypeName"      varchar   not null,
    "Deprecated"                            boolean   not null,
    "MajorVersionNumber"                    integer   not null,
    "MinorVersionNumber"                    integer,
    "UpdatedTimeStamp"                      timestamp not null,
    "TestInstructionContainerColor"         varchar   not null,
    "TCRuleDeletion"                        varchar   not null
        constraint basictestinstructioncontainerinformation_tcrulesdeletion_deleti
            references "FenixBuilder"."TCRulesDeletion",
    "TCRuleSwap"                            varchar   not null
        constraint basictestinstructioncontainerinformation_tcruleswap_swaprule_fk
            references "FenixBuilder"."TCRuleSwap",
    "TestInstructionContainerDescription"   varchar   not null,
    "TestInstructionContainerMouseOverText" varchar   not null,
    "Enabled"                               boolean   not null,
    "TestInstructionContainerExecutionType" varchar   not null
        constraint basictestinstructioncontainerinformation_testinstructioncontain
            references "FenixBuilder"."TestInstructionContainerExecutionTypes"
);

comment on table "FenixBuilder"."BasicTestInstructionContainerInformation" is 'Holding Basic information for one TestInstructionContainer';

alter table "FenixBuilder"."BasicTestInstructionContainerInformation"
    owner to postgres;

COMMIT;