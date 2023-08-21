	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;	

insert into "FenixBuilder"."TestInstructionContainerExecutionTypes" ("TestInstructionContainerExecutionType", "GrpcMapping")
values  ('PARALLELLED_PROCESSED', 1),
        ('SERIAL_PROCESSED', 2);

COMMIT;