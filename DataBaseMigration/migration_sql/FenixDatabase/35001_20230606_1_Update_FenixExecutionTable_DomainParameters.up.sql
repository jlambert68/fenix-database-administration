-- noinspection SqlNoDataSourceInspectionForFile

BEGIN ;

UPDATE "FenixExecution"."DomainParameters"
SET "ExecutionWorker Address" = 'fenix-execution-worker-custodyarrangement-wudr6vfajq-lz.a.run.app'
WHERE "DomainUuid" = '78a97c41-a098-4122-88d2-01ed4b6c4844';

UPDATE "FenixExecution"."DomainParameters"
SET "ExecutionWorker Address" = 'fenix-execution-worker-subcustody-wudr6vfajq-lz.a.run.app'
WHERE "DomainUuid" = '7edf2269-a8d3-472c-aed6-8cdcc4a8b6ae';

-- 78a97c41-a098-4122-88d2-01ed4b6c4844 = Custody Arrangement
-- 7edf2269-a8d3-472c-aed6-8cdcc4a8b6ae = Sub Custody

COMMIT ;


