	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

-- Delete Indexes
DROP INDEX IF EXISTS testcasemodelelementtypes_grpcmappingid_uindex;

DROP INDEX IF EXISTS basictestinstructioncontainerinformation_testinstructioncontain;

DROP INDEX IF EXISTS testinstructioncontainerexecutiontypes_grpcmapping_uindex;

COMMIT ;
