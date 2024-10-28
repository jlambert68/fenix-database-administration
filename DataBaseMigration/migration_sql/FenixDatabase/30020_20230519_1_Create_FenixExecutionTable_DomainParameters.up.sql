-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."DomainParameters"
(
    "DomainUuid"              uuid    not null
        primary key,
    "DomainName"              varchar not null,
    "ExecutionWorker Address" varchar not null
);

comment on table "FenixExecution"."DomainParameters" is 'Hold parameters for the DOmains';

alter table "FenixExecution"."DomainParameters"
    owner to postgres;

COMMIT;

