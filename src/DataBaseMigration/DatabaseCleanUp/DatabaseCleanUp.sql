-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

SELECT * FROM "FenixExecution"."TestCaseExecutionQueue";
SELECT * FROM "FenixExecution"."TestCasesFinishedExecution";
SELECT * FROM "FenixExecution"."TestCasesUnderExecution";
SELECT * FROM "FenixExecution"."TestInstructionAttributesUnderExecution";
SELECT * FROM "FenixExecution"."TestInstructionExecutionQueue";
SELECT * FROM "FenixExecution"."TestInstructionsUnderExecution";


DELETE FROM "FenixExecution"."TestCaseExecutionQueue";
DELETE FROM "FenixExecution"."TestCasesFinishedExecution";
DELETE FROM "FenixExecution"."TestCasesUnderExecution";
DELETE FROM "FenixExecution"."TestInstructionAttributesUnderExecution";
DELETE FROM "FenixExecution"."TestInstructionExecutionQueue";
DELETE FROM "FenixExecution"."TestInstructionsUnderExecution";

COMMIT;