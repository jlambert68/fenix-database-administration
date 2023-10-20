-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixExecution"."ProcessingCapabilityForClientSystemEnum"
(
    "gRPC_Id"   integer not null
        primary key
        unique,
    "gRPC_Name" varchar not null
        unique
);

comment on table "FenixExecution"."ProcessingCapabilityForClientSystemEnum" is 'Holds execution capabilities that client client can have';

alter table "FenixExecution"."ProcessingCapabilityForClientSystemEnum"
    owner to postgres;


COMMIT;
