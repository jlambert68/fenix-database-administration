
-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."ProcessingCapabilityForClientSystem"
(
    "DomainUuid"                          uuid      not null
        unique,
    "DomainName"                          varchar   not null,
    "TestInstructionProcessingCapability" integer   not null,
    "TestCaseProcessingCapability"        integer   not null,
    "TestSuiteProcessingCapability"       integer,
    "UpdatedTimeStamp"                    timestamp not null
);

comment on table "FenixExecution"."ProcessingCapabilityForClientSystem" is 'Holds the clients execution capabilities for all execution clients';

alter table "FenixExecution"."ProcessingCapabilityForClientSystem"
    owner to postgres;


COMMIT;
