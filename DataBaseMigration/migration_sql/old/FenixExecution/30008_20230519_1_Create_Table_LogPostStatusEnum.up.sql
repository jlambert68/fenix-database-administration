-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."LogPostStatusEnum"
(
    "gRPC_Id"   integer not null
        primary key,
    "gRPC_Name" varchar not null
        unique
);

comment on table "FenixExecution"."LogPostStatusEnum" is 'Holds the different typings for logposts from clients executions ';

alter table "FenixExecution"."LogPostStatusEnum"
    owner to postgres;


COMMIT;

