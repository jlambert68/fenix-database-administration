-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

    insert into "FenixExecution"."TestSuiteExecutionStatusEnum" ("gRPC_Id", "gRPC_Name")
    values  (1, 'TSE_INITIATED'),
            (2, 'TSE_EXECUTING'),
            (3, 'TSE_CONTROLLED_INTERRUPTION'),
            (4, 'TSE_CONTROLLED_INTERRUPTION_CAN_BE_RERUN'),
            (5, 'TSE_FINISHED_OK'),
            (6, 'TSE_FINISHED_OK_CAN_BE_RERUN'),
            (7, 'TSE_FINISHED_NOT_OK'),
            (8, 'TSE_FINISHED_NOT_OK_CAN_BE_RERUN'),
            (9, 'TSE_UNEXPECTED_INTERRUPTION'),
            (10, 'TSE_UNEXPECTED_INTERRUPTION_CAN_BE_RERUN'),
            (11, 'TSE_TIMEOUT_INTERRUPTION'),
            (12, 'TSE_TIMEOUT_INTERRUPTION_CAN_BE_RERUN');

COMMIT;