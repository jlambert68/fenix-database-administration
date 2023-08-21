	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

    insert into "FenixExecution"."TestInstructionExecutionStatusEnum" ("gRPC_Id", "gRPC_Name")
    values  (0, 'VALUE_NOT_SET'),
            (1, 'TIE_INITIATED'),
            (2, 'TIE_EXECUTING'),
            (3, 'TIE_CONTROLLED_INTERRUPTION'),
            (4, 'TIE_CONTROLLED_INTERRUPTION_CAN_BE_RERUN'),
            (5, 'TIE_FINISHED_OK'),
            (6, 'TIE_FINISHED_OK_CAN_BE_RERUN'),
            (7, 'TIE_FINISHED_NOT_OK'),
            (8, 'TIE_FINISHED_NOT_OK_CAN_BE_RERUN'),
            (9, 'TIE_UNEXPECTED_INTERRUPTION'),
            (10, 'TIE_UNEXPECTED_INTERRUPTION_CAN_BE_RERUN'),
            (11, 'TIE_TIMEOUT_INTERRUPTION'),
            (12, 'TIE_TIMEOUT_INTERRUPTION_CAN_BE_RERUN');

COMMIT;