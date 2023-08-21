	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;	

insert into "FenixBuilder".TestInstructionContainerExecutionTypes (TestInstructionContainerExecutionType, GrpcMapping)
values  ('PARALLELLED_PROCESSED', 0),
        ('SERIAL_PROCESSED', 1);

COMMIT;