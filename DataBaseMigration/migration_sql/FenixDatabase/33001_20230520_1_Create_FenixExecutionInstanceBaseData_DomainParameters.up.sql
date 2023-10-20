	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

    insert into "FenixExecution"."DomainParameters" ("DomainUuid", "DomainName", "ExecutionWorker Address")
    values  ('78a97c41-a098-4122-88d2-01ed4b6c4844', 'Custody Arrangement', 'fenixexecutionworker-ca-must-be-logged-in-nwxrrpoxea-lz.a.run.app'),
            ('7edf2269-a8d3-472c-aed6-8cdcc4a8b6ae', 'Sub Custody', 'fenixexecutionworker-sc-must-be-logged-in-nwxrrpoxea-lz.a.run.app');

COMMIT;