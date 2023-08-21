	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

insert into "FenixBuilder"."TestInstructions" ("DomainUuid", "DomainName", "TestInstructionUuid", "TestInstructionName", "TestInstructionTypeUuid", "TestInstructionTypeName", "TestInstructionDescription", "TestInstructionMouseOverText", "Deprecated", "Enabled", "MajorVersionNumber", "MinorVersionNumber", "UpdatedTimeStamp")
values  ('78a97c41-a098-4122-88d2-01ed4b6c4844', 'Custody Arrangement', '2f130d7e-f8aa-466f-b29d-0fb63608c1a6', 'Just the name', '513dd8fb-a0bb-4738-9a0b-b7eaf7bb8adb', 'The type of the TestInstruction', 'En vanlig typ', 'This will be shown when hovering above this TestInstruction', false, true, 0, 1, '2022-04-29 15:42:15.000000'),
        ('78a97c41-a098-4122-88d2-01ed4b6c4844', 'Custody Arrangement', 'ceb23b06-c1b3-4981-9806-0a53bbe42a67', 'Add or Delete Selected Swift', 'ceca6136-66df-4dcc-930f-44d729142334', 'Fund Execution Agreement management', 'Add or Delete Selected Swift', 'Add or Delete Selected Swift', false, true, 0, 1, '2022-09-01 07:33:42.000000'),
        ('78a97c41-a098-4122-88d2-01ed4b6c4844', 'Custody Arrangement', 'f3f7723e-d117-434a-9583-30db87d198ce', 'Search', '5005928a-f253-4828-9c2f-023571760759', 'Custody Account', 'Search for a specific Custody Account', 'Search for a specific Custody Account', false, true, 0, 1, '2022-10-24 12:51:13.358179'),
        ('78a97c41-a098-4122-88d2-01ed4b6c4844', 'Custody Arrangement', '3a32edd4-7c73-4d05-9971-9a306dce8df7', 'TestCaseSetUp', 'a8edbfba-4b1f-4777-8196-1323ad75620f', 'GeneralSetUpTearDown', 'Initiate Custody Arrangements execution engine to be able to execute TestInstructions', 'Initiate Custody Arrangements execution engine to be able to execute TestInstructions', false, true, 0, 1, '2022-10-24 12:51:13.358407'),
        ('78a97c41-a098-4122-88d2-01ed4b6c4844', 'Custody Arrangement', '874a91df-e5c0-4369-ad3f-ce8aad8bc317', 'TestCaseTearDown', 'a8edbfba-4b1f-4777-8196-1323ad75620f', 'GeneralSetUpTearDown', 'TearDown the Custody Arrangements execution engine after executing TestInstructions', 'TearDown the Custody Arrangements execution engine after executing TestInstructions', false, true, 0, 1, '2022-10-24 12:51:13.358536'),
        ('78a97c41-a098-4122-88d2-01ed4b6c4844', 'Custody Arrangement', '19c2a8b9-c48b-4f5e-9f41-a9b571f77ebb', 'Edit', 'c0ab80af-4371-41af-b555-bdd1368c4095', 'Settlement Agreement management', 'Edit an existing Settlement Agreement', 'Edit an existing Settlement Agreement', false, true, 0, 1, '2022-10-24 12:51:13.358706'),
        ('78a97c41-a098-4122-88d2-01ed4b6c4844', 'Custody Arrangement', 'b81cb0e0-589e-4209-beab-7b745dd349e3', 'AddSelectedSwift', 'c0ab80af-4371-41af-b555-bdd1368c4095', 'Settlement Agreement management', 'AddSelectedSwift to an existing Settlement Agreement', 'AddSelectedSwift to an existing Settlement Agreement', false, true, 0, 1, '2022-10-24 12:51:13.359610'),
        ('78a97c41-a098-4122-88d2-01ed4b6c4844', 'Custody Arrangement', '889b3337-fd6d-4bdb-9dc6-0fd6ed04a43b', 'DeleteSelectedSwift', 'c0ab80af-4371-41af-b555-bdd1368c4095', 'Settlement Agreement management', 'DeleteSelectedSwift for an existing Settlement Agreement', 'DeleteSelectedSwift for an existing Settlement Agreement', false, true, 0, 1, '2022-10-24 12:51:13.360181'),
        ('78a97c41-a098-4122-88d2-01ed4b6c4844', 'Custody Arrangement', '1f59bf39-6201-4841-948b-109c04e1557a', 'AddSelectedInstructedParties', 'c0ab80af-4371-41af-b555-bdd1368c4095', 'Settlement Agreement management', 'AddSelectedInstructedParties for an existing Settlement Agreement', 'AddSelectedInstructedParties for an existing Settlement Agreement', false, true, 0, 1, '2022-10-24 12:51:13.360758'),
        ('7edf2269-a8d3-472c-aed6-8cdcc4a8b6ae', 'Sub Custody', '26d38886-c112-48ef-a20f-4da8fb9a5ccb', 'TestCaseSetUp', 'a04538f9-a50b-469a-a842-840c9c95b5f1', 'GeneralSetUpTearDown', 'Initiate _SCs execution engine to be able to execute TestInstructions', 'Initiate _SCs execution engine to be able to execute TestInstructions', false, true, 0, 1, '2023-01-04 18:12:28.885080'),
        ('7edf2269-a8d3-472c-aed6-8cdcc4a8b6ae', 'Sub Custody', '89959686-1599-4a5f-bcf6-5b427cbdce93', 'TestCaseTearDown', 'a04538f9-a50b-469a-a842-840c9c95b5f1', 'GeneralSetUpTearDown', 'TearDown the _SCs execution engine after executing TestInstructions', 'TearDown the _SCs execution engine after executing TestInstructions', false, true, 0, 1, '2023-01-04 18:12:28.885275');

COMMIT;