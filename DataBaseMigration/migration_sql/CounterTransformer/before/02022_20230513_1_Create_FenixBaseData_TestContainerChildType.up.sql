	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;
	
insert into "FenixBuilder".TestContainerChildType (TestInstructionContainerChildType, TestInstructionContainerChildDescription)
values  (1, 'TestInstruction'),
        (2, 'TestContainer');

COMMIT;