-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

ALTER TABLE "FenixBuilder"."TestCases"
    DROP "TestCaseExtraInformationAsJsonb";

COMMIT ;