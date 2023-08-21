	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;
insert into "FenixBuilder"."TestInstructionAttributeTypes" ("TestInstructionAttributeType")
values  ('TEXTBOX'),
        ('COMBOBOX'),
        ('FILE_SELECTOR'),
        ('FUNCTION_SELECTOR');

COMMIT;