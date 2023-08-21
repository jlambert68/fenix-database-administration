-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

ALTER TABLE "FenixBuilder"."TestCases"
    DROP "TestCaseExtraInformationJsonb";

COMMIT ;