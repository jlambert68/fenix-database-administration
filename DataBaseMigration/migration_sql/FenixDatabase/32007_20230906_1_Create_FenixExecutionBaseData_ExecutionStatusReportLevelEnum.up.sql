	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

    insert into "FenixExecution"."ExecutionStatusReportLevelEnum"  ("gRPC_Id", "gRPC_Id_Description")
    values  (1, 'NO_STATUS_REPORTING_FOR_EXECUTION'),
            (2, 'REPORT_ALL_STATUS_CHANGES_ON_EXECUTIONS'),
            (3, 'REPORT_ONLY_ALL_END_STATUS_CHANGES_ON_EXECUTIONS'),
            (4, 'REPORT_ONLY_ALL_STATUS_CHANGES_ON_TESTCASE_EXECUTIONS'),
            (5, 'REPORT_ONLY_ALL_END_STATUS_CHANGES_ON_TESTCASE_EXECUTIONS');

COMMIT;