	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

    insert into "FenixExecution"."ProcessingCapabilityForClientSystem" ("DomainUuid", "DomainName", "TestInstructionProcessingCapability", "TestCaseProcessingCapability", "TestSuiteProcessingCapability", "UpdatedTimeStamp")
    values  ('78a97c41-a098-4122-88d2-01ed4b6c4844', 'Custody Arrangement', 1, 1, 1, '2022-09-26 09:58:42.000000'),
            ('7edf2269-a8d3-472c-aed6-8cdcc4a8b6ae', 'Sub Custody', 1, 1, 1, '2023-05-20 12:46:42.000000');

COMMIT;