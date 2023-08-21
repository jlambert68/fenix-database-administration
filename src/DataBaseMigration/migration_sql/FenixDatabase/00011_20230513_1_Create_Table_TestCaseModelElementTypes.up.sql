	-- noinspection SqlNoDataSourceInspectionForFile
	
BEGIN;

CREATE TABLE IF NOT EXISTS "FenixBuilder"."TestCaseModelElementTypes"
(
    "TestCaseModelElementType"            varchar not null
        constraint testcasemodelelementtypes_pk
            primary key,
    "TestCaseModelElementTypeDescription" varchar not null,
    "GrpcMappingId"                       integer not null
);

comment on table "FenixBuilder"."TestCaseModelElementTypes" is 'All TestCaseModel-elements';

alter table "FenixBuilder"."TestCaseModelElementTypes"
    owner to postgres;

COMMIT;