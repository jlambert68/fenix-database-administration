	-- noinspection SqlNoDataSourceInspectionForFile
	
BEGIN;

CREATE UNIQUE INDEX IF NOT EXISTS testcasemodelelementtypes_grpcmappingid_uindex
    on "FenixBuilder"."TestCaseModelElementTypes" using heap ("GrpcMappingId");

CREATE UNIQUE INDEX IF NOT EXISTS basictestinstructioncontainerinformation_testinstructioncontain
    on "FenixBuilder"."BasicTestInstructionContainerInformation" using heap ("TestInstructionContainerUuid");

CREATE UNIQUE INDEX IF NOT EXISTS testinstructioncontainerexecutiontypes_grpcmapping_uindex
    on "FenixBuilder"."TestInstructionContainerExecutionTypes" using heap ("GrpcMapping");

COMMIT ;