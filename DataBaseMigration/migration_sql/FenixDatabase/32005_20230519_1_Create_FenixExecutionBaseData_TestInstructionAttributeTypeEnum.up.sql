	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

    insert into "FenixExecution"."TestInstructionAttributeTypeEnum" ("gRPC_Id", "gRPC_Name")
    values  (1, 'TEXTBOX'),
            (2, 'COMBOBOX'),
            (3, 'FILE_SELECTOR'),
            (4, 'FUNCTION_SELECTOR');

COMMIT;