	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;
	
CREATE TABLE IF NOT EXISTS "FenixBuilder"."ImmatureBonds"
(
    "BondUuid"                              uuid      not null
        constraint immaturebonds_pk
            primary key,
    "BondName"                              varchar   not null,
    "BondDescription"                       varchar   not null,
    "BondMouseOverText"                     varchar   not null,
    "Deprecated"                            boolean   not null,
    "Enabled"                               boolean   not null,
    "Visible"                               boolean   not null,
    "BondColor"                             varchar   not null,
    "CanBeDeleted"                          boolean   not null,
    "CanBeSwappedOut"                       boolean   not null,
    "ShowBondAttributes"                    boolean   not null,
    "TCRuleDeletion"                        varchar   not null
        constraint immaturebonds_tcrulesdeletion_deletionrule_fk
            references "FenixBuilder"."TCRulesDeletion",
    "TCRuleSwap"                            varchar   not null
        constraint immaturebonds_tcruleswap_swaprule_fk
            references "FenixBuilder"."TCRuleSwap",
    "UpdatedTimeStamp"                      timestamp not null,
    "TestCaseModelElementType"              varchar   not null,
    "TestCaseModelElementTypeGrpcMappingId" integer   not null
);

comment on table "FenixBuilder"."ImmatureBonds" is 'Message holding all immature bonds that can be used within the TestCase-model';

alter table "FenixBuilder"."ImmatureBonds"
    owner to postgres;

COMMIT;