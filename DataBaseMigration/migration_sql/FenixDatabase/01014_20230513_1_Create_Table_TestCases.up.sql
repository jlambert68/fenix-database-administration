	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

CREATE TABLE IF NOT EXISTS "FenixBuilder"."TestCases"
(
    "DomainUuid"                                                      uuid,
    "DomainName"                                                      varchar,
    "TestCaseUuid"                                                    uuid,
    "TestCaseName"                                                    varchar,
    "TestCaseVersion"                                                 integer,
    "TestCaseBasicInformationAsJsonb"                                 jsonb,
    "TestInstructionsAsJsonb"                                         jsonb not null,
    "TestInstructionContainersAsJsonb"                                jsonb not null,
    "UniqueCounter"                                                   serial,
    "TestCaseHash"                                                    varchar,
    "TestCaseExtraInformationAsJsonb"                                 jsonb,
    "CanListAndViewTestCaseAuthorizationLevelOwnedByDomain"           bigint,
    "CanListAndViewTestCaseAuthorizationLevelHavingTiAndTicWithDomai" bigint,
    "TestCaseIsDeleted"                                               boolean,
    "TestCaseTemplateFilesAsJsonb"                                    jsonb,
    "InsertTimeStamp"                                                 timestamp,
    "TestCasePreview"                                                 jsonb,
    "DeleteTimestamp"                                                 timestamp default '2068-11-18 00:00:00'::timestamp without time zone,
    "DeletedInsertedTImeStamp"                                        timestamp,
    "DeletedByGCPAuthenticatedUser"                                   varchar,
    "TestCaseMetaData"                                                 jsonb,
    constraint testcases_pk
        unique ("TestCaseUuid", "TestCaseVersion", "TestCaseIsDeleted")
);


comment on table "FenixBuilder"."TestCases" is 'Holds all TestCases as a JSONB-structure';

alter table "FenixBuilder"."TestCases"
    owner to postgres;

COMMIT;



