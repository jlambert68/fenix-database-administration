-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

ALTER TABLE "FenixExecution"."TestInstructionsUnderExecution"
    ADD "TestInstructionExecutionResendCounter" int default 0;

COMMIT ;
