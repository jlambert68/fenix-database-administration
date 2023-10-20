-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."ExecutionLogPosts"
(
    "DomainUuid"               uuid      not null,
    "DomainName"               varchar   not null,
    "LogPostUuid"              uuid      not null
        primary key,
    "LogPostTimeStamp"         timestamp not null,
    "LogPostStatus"            integer,
    "LogPostText"              varchar,
    "HasFoundVsExpectedValues" boolean   not null
);

comment on table "FenixExecution"."ExecutionLogPosts" is 'Holds all execution log posts produced by execution clients';

alter table "FenixExecution"."ExecutionLogPosts"
    owner to postgres;


COMMIT;

