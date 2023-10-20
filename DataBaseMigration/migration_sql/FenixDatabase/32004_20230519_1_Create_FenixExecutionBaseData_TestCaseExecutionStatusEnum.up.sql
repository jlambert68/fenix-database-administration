	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

    insert into "FenixExecution"."TestCaseExecutionStatusEnum" ("gRPC_Id", "gRPC_Name")
    values  (1, 'TCE_INITIATED'),
            (2, 'TCE_EXECUTING'),
            (3, 'TCE_CONTROLLED_INTERRUPTION'),
            (4, 'TCE_CONTROLLED_INTERRUPTION_CAN_BE_RERUN'),
            (5, 'TCE_FINISHED_OK'),
            (6, 'TCE_FINISHED_OK_CAN_BE_RERUN'),
            (7, 'TCE_FINISHED_NOT_OK'),
            (8, 'TCE_FINISHED_NOT_OK_CAN_BE_RERUN'),
            (9, 'TCE_UNEXPECTED_INTERRUPTION'),
            (10, 'TCE_UNEXPECTED_INTERRUPTION_CAN_BE_RERUN'),
            (11, 'TCE_TIMEOUT_INTERRUPTION'),
            (12, 'TCE_TIMEOUT_INTERRUPTION_CAN_BE_RERUN');

COMMIT;