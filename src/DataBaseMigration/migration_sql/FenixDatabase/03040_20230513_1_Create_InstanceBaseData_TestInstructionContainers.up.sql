	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;
	
insert into "FenixBuilder"."TestInstructionContainers" ("DomainUuid", "DomainName", "TestInstructionContainerUuid", "TestInstructionContainerName", "TestInstructionContainerTypeUuid", "TestInstructionContainerTypeName", "TestInstructionContainerDescription", "TestInstructionContainerMouseOverText", "Deprecated", "Enabled", "MajorVersionNumber", "MinorVersionNumber", "UpdatedTimeStamp", "ChildrenIsParallelProcessed")
values  ('e81b9734-5dce-43c9-8d77-3368940cf126', 'Fenix', 'f81b9734-5dce-43c9-8d77-3368940cf126', 'Emtpy serial processed TestInstructionsContainer', 'b107bdd9-4152-4020-b3f0-fc750b45885e', 'Base containers', 'Children of this container is processed in serial', 'Children of this container is processed in serial', false, true, 0, 1, '2022-05-02 10:10:07.000000', false),
        ('e81b9734-5dce-43c9-8d77-3368940cf126', 'Fenix', 'e107bdd9-4152-4020-b3f0-fc750b45885e', 'Emtpy parallelled processed TestInstructionsContainer', 'b107bdd9-4152-4020-b3f0-fc750b45885e', 'Base containers', 'Children of this container is processed in parallel', 'Children of this container is processed in parallel', false, true, 0, 1, '2022-05-02 10:08:28.000000', true),
        ('78a97c41-a098-4122-88d2-01ed4b6c4844', 'Custody Arrangement', 'aa1b9734-5dce-43c9-8d77-3368940cf126', 'Emtpy parallelled processed Turbo TestInstructionsContainer', 'ca07bdd9-4152-4020-b3f0-fc750b45885e', 'CA Base containers', 'Children of this CA-container is processed in parallel', 'Children of this CA-container is processed in parallel', false, true, 0, 1, '2022-06-16 16:09:43.000000', true);	
	
COMMIT;