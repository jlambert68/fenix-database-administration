	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

    insert into "FenixExecution"."LogPostStatusEnum" ("gRPC_Id", "gRPC_Name")
    values  (1, 'INFO'),
            (2, 'WARNING'),
            (3, 'VALIDATION_OK'),
            (4, 'VALIDATION_ERROR');

COMMIT;