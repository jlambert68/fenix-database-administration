	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

    insert into "FenixExecution"."TestInstructionAttributeTypeEnum" ("gRPC_Id", "gRPC_Name")
    values  (0, 'VALUE_NOT_SET'),
            (1, 'TEXTBOX'),
            (2, 'COMBOBOX'),
            (3, 'FILE_SELECTOR'),
            (4, 'FUNCTION_SELECTOR');

COMMIT;