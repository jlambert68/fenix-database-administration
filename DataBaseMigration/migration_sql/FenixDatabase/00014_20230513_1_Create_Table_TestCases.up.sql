	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

CREATE TABLE IF NOT EXISTS "FenixBuilder"."TestCases"
(
    "DomainUuid"                       uuid,
    "DomainName"                       varchar,
    "TestCaseUuid"                     uuid,
    "TestCaseName"                     varchar,
    "TestCaseVersion"                  integer,
    "TestCaseBasicInformationAsJsonb"  jsonb,
    "TestInstructionsAsJsonb"          jsonb not null,
    "TestInstructionContainersAsJsonb" jsonb not null,
    "UniqueCounter"                    serial,
    "TestCaseHash"                      varchar,
    "TestCaseExtraInformationAsJsonb" jsonb,
    constraint testcases_pk
        unique ("TestCaseUuid", "TestCaseVersion")

);

comment on table "FenixBuilder"."TestCases" is 'Holds all TestCases as a JSONB-structure';

alter table "FenixBuilder"."TestCases"
    owner to postgres;

COMMIT;
	

