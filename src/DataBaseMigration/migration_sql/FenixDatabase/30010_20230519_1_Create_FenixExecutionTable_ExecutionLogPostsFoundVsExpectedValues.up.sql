-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."ExecutionLogPostsFoundVsExpectedValues"
(
    "LogPostUuid"   uuid not null
        constraint executionlogpostsfoundvsexpectedvalues_executionlogposts_logpos
            references "FenixExecution"."ExecutionLogPosts",
    "ExpectedValue" varchar,
    "FoundValue"    varchar
);

comment on table "FenixExecution"."ExecutionLogPostsFoundVsExpectedValues" is 'Holds potential values of what was expected vs what whas found during execution';

alter table "FenixExecution"."ExecutionLogPostsFoundVsExpectedValues"
    owner to postgres;

COMMIT;

