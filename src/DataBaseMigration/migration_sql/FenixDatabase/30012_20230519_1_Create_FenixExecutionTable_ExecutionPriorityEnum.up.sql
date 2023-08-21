-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;


create table "FenixExecution"."ExecutionPriorityEnum"
(
    "PriorityId"          integer not null
        primary key
        unique,
    "PriorityName"        varchar not null,
    "PriorityDescription" varchar not null
);

comment on table "FenixExecution"."ExecutionPriorityEnum" is 'Holds the different execution priority used by the execution engine';

alter table "FenixExecution"."ExecutionPriorityEnum"
    owner to postgres;


COMMIT;

