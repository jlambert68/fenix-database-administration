	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;
	
    insert into "FenixBuilder"."AttributeActionCommandEnum" ("gRPC_Id", "gRPC_Name")
    values  (0, 'VALUE_NOT_SET'),
            (1, 'USE_DROPZONE_VALUE_FOR_ATTRIBUTE'),
            (2, 'REMOVE_ATTRIBUTE_FROM_TESTINSTRUCTION');
		
COMMIT;