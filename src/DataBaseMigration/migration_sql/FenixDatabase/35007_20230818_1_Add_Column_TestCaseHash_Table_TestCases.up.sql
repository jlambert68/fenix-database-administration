-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

ALTER TABLE "FenixBuilder"."TestCases"
    ADD "TestCaseHash" varchar;

COMMIT ;
