-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."ExecutionStatusReportLevelEnum"
(
    "gRPC_Id"   integer not null
        primary key
        unique,
    "gRPC_Id_Description" varchar not null
);

comment on table "FenixExecution"."ExecutionStatusReportLevelEnum" is 'Holds the definitions for the differentReporting Levels';

alter table "FenixExecution"."ExecutionStatusReportLevelEnum"
    owner to postgres;

COMMIT;

