	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

    insert into "FenixExecution"."DomainParameters" ("DomainUuid", "DomainName", "ExecutionWorker Address")
    values  ('78a97c41-a098-4122-88d2-01ed4b6c4844', 'Custody Arrangement', 'fenix-execution-worker-custodyarrangement-wudr6vfajq-lz.a.run.app'),
            ('16458c6c-4f4f-4011-8bd6-34750490c8c1', 'OnPremDemo', 'fenixexecutionworker-sc-must-be-logged-in-nwxrrpoxea-lz.a.run.'),
            ('7edf2269-a8d3-472c-aed6-8cdcc4a8b6ae', 'Sub Custody', 'fenix-sub-custody-worker-nwxrrpoxea-lz.a.run.app');

COMMIT;