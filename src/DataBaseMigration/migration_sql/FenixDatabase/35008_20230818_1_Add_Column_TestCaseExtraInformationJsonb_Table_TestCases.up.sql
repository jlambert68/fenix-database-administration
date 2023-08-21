-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

ALTER TABLE "FenixBuilder"."TestCases"
    ADD "TestCaseExtraInformationJsonb" jsonb;

COMMIT ;