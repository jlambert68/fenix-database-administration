-- noinspection SqlNoDataSourceInspectionForFile

-- Standard Dev environment

BEGIN;

-- Add values too the Domains-tables
INSERT INTO "FenixDomainAdministration"."domains" ("domain_uuid", "domain_name", "description", "activated", "deleted", "update_timestamp", "replaced_by_new_version", "domain_id", "domain_version", "workeraddress", "bitnumbername", "AllUsersCanListAndViewTestCaseHavingTIandTICFromThisDomain", "AllUsersCanBuildAndSaveTestCaseHavingTIandTICFromThisDomain")
VALUES  ('8a645b7b-2bb4-4a3e-84db-6869b5ad292d', 'Custody Cash', 'Stuff that is maintained by CAX-team', true, false, '2022-01-25 19:00:17.000000', false, 1, 1, 'x3', 'bitposition_2', false, false),
        ('78a97c41-a098-4122-88d2-01ed4b6c4844', 'Custody Arrangement', 'uff that is maintained by CAX-team', true, false, '2022-04-29 15:30:41.000000', false, 1, 1, 'x1', 'bitposition_4', false, false),
        ('16458c6c-4f4f-4011-8bd6-34750490c8c1', 'OnPremDemo', 'A OnPrem Demo-Connector-Project', true, false, '2023-12-27 20:12:45.000000', false, 1, 1, 'fenixexecutionworker-sc-must-be-logged-in-nwxrrpoxea-lz.a.run.app', 'bitposition_1', false, false),
        ('e81b9734-5dce-43c9-8d77-3368940cf126', 'Fenix', 'Services that Fenix is offering', true, false, '2022-05-02 09:52:25.000000', false, 1, 1, 'fenix-standard-worker-nwxrrpoxea-lz.a.run.app', 'bitposition_0', true, true),
        ('7edf2269-a8d3-472c-aed6-8cdcc4a8b6ae', 'Sub Custody', 'Everything that has to do with Sub Custody', true, false, '2023-01-04 18:23:30.000000', false, 1, 1, 'fenix-sub-custody-worker-nwxrrpoxea-lz.a.run.app', 'bitposition_3', false, false);

COMMIT ;
