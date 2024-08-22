-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixBuilder"."UsersTestDataForTestCase" (
                                                           "DomainUuid" uuid not null,
                                                           "DomainName" character varying not null,
                                                           "TestCaseUuid" uuid not null,
                                                           "TestCaseName" character varying not null,
                                                           "TestCaseVersion" integer not null,
                                                           "TestData" jsonb not null,
                                                           "TestDataHash" character varying not null,
                                                           "TestCaseIsDeleted" boolean not null,
                                                           "InsertedTimeStamp" timestamp without time zone not null,
                                                           "GcpAuthenticatedUser" character varying not null,
                                                           primary key ("TestCaseUuid", "TestCaseVersion")
);

comment on table "FenixBuilder"."UsersTestDataForTestCase" is 'Holds users chosen TestData for a TestCase';

alter table "FenixBuilder"."UsersTestDataForTestCase"
    owner to postgres;

COMMIT ;





