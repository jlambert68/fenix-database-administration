	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

    insert into "FenixExecution"."ProcessingCapabilityForClientSystemEnum" ("gRPC_Id", "gRPC_Name")
    values  (0, 'VALUE_NOT_SET'),
            (1, 'CAN_PROCESS_IN_PARALLEL'),
            (2, 'CAN_ONLY_PROCESS_IN_SERIAL'),
            (3, 'STOP_SEND_NEW_EXECUTION_TASKS');

COMMIT;