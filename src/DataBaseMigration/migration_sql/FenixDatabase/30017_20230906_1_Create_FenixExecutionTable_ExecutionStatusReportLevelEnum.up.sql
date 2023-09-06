-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."ExecutionStatusReportLevelEnum"
(
    "gRPC_Id"             serial
        constraint "ExecutionStatusReportLevelEnum _pk"
            primary key,
    "gRPC_Id_Description" varchar not null
);

comment on table "FenixExecution"."ExecutionStatusReportLevelEnum" is 'Holds the definitions for the differentReporting Levels';

alter table "FenixExecution"."ExecutionStatusReportLevelEnum"
    owner to postgres;

COMMIT;

