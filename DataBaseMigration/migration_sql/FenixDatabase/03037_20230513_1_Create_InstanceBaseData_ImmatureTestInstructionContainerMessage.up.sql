	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

insert into "FenixBuilder"."ImmatureTestInstructionContainerMessage" ("DomainUuid", "DomainName", "TestInstructionContainerUuid", "TestInstructionContainerName", "DropZoneUuid", "DropZoneName", "DropZoneDescription", "DropZoneMouseOver", "DropZoneColor", "TestInstructionAttributeType", "TestInstructionAttributeUuid", "TestInstructionAttributeName", "AttributeValueAsString", "AttributeValueUuid", "FirstImmatureElementUuid")
values  ('e81b9734-5dce-43c9-8d77-3368940cf126', 'Fenix', 'f81b9734-5dce-43c9-8d77-3368940cf126', 'Emtpy serial processed TestInstructionsContainer', 'c5e37024-e40c-49f7-8667-eab485c65105', 'My first DropZone for a TestInstructionContainer', 'This is the Description of my first DropZone', 'This is the mouseover text for my first DropZone', '#0000e', 'TEXTBOX', '5cc2566e-bf27-44fd-818c-4591fa9c603c', 'This attributes holds a Text but attribute is missing', 'LambertJonas', '7fb2566e-bf27-44fd-818c-4591fa9c603c', 'f81b9734-5dce-43c9-8d77-3368940cf126');

COMMIT;