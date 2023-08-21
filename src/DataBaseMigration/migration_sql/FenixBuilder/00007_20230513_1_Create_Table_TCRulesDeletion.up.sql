	-- noinspection SqlNoDataSourceInspectionForFile
	
BEGIN;

CREATE TABLE IF NOT EXISTS "FenixBuilder"."TCRulesDeletion"
(
    "DeletionRule" varchar not null
        constraint tcrulesdeletion_pk
            primary key
);

comment on table "FenixBuilder"."TCRulesDeletion" is 'Hold all Deletion Rules for Building Block';

alter table "FenixBuilder"."TCRulesDeletion"
    owner to postgres;

COMMIT;