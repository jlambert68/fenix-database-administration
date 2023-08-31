-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

ALTER TABLE "FenixBuilder"."TestCases"
    ADD "TestCaseExtraInformationAsJsonb" jsonb;

COMMIT ;