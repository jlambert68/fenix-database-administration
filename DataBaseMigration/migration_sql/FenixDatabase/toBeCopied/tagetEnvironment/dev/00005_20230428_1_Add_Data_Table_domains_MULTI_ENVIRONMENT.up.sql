-- noinspection SqlNoDataSourceInspectionForFile

-- Target environment
BEGIN;

-- Add values too the Domains-tables
INSERT INTO "FenixDomainAdministration"."domains" ("domain_uuid", "domain_name", "description", "activated", "deleted", "update_timestamp", "replaced_by_new_version", "domain_id", "domain_version", "workeraddress", "bitnumbername", "AllUsersCanListAndViewTestCaseHavingTIandTICFromThisDomain", "AllUsersCanBuildAndSaveTestCaseHavingTIandTICFromThisDomain", "PublicKey")
VALUES  ('e81b9734-5dce-43c9-8d77-3368940cf126', 'Fenix', 'Services that Fenix is offering', true, false, '2022-05-02 09:52:25.000000', false, 1, 1, 'fenix-execution-worker-fenixstandard-721577729507.europe-north1.run.app', 'bitposition_0', true, true, 'BEmEDs+lZnvxxPmuoPp70k42JdbhJoAGtI+h7T5XFgqsAXunpUrEESa0q+dxp/GOnomkRvOvonD6YM0pEWt5QAc='),
        ('7edf2269-a8d3-472c-aed6-8cdcc4a8b6ae', 'Sub Custody', 'Everything that has to do with Sub Custody', true, false, '2023-01-04 18:23:30.000000', false, 1, 1, 'fenix-execution-worker-fenixstandard-721577729507.europe-north1.run.app', 'bitposition_3', false, false, 'BFiuZRh7xvvYzX1rTlZ+Tq/0JRWlMGatPvFKQDwAD30S4TU99mI/WRBtocaUDMmkJnLqMwRuEw0SnkpiqnaURAo=');

COMMIT ;
