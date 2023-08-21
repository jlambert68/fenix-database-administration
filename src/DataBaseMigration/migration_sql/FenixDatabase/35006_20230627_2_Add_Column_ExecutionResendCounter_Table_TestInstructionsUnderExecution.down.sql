-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

ALTER TABLE "FenixExecution"."TestInstructionsUnderExecution"
    DROP "TestInstructionExecutionResendCounter";

COMMIT ;