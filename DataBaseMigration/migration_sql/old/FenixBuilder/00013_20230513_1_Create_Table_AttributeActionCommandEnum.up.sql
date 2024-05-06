	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;
	
CREATE TABLE IF NOT EXISTS "FenixBuilder"."AttributeActionCommandEnum"
(
    "gRPC_Id"   integer not null
        primary key
        unique,
    "gRPC_Name" varchar not null
        unique
);

comment on table "FenixBuilder"."AttributeActionCommandEnum" is 'Holds the different actions a DropZone-attribute can have';

alter table "FenixBuilder"."AttributeActionCommandEnum"
    owner to postgres;

COMMIT;