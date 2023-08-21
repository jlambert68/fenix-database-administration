	-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;
	
CREATE TABLE IF NOT EXISTS "FenixBuilder"."TCRuleSwap"
(
    "SwapRule" varchar not null
        constraint tcruleswap_pk
            primary key
);

comment on table "FenixBuilder"."TCRuleSwap" is 'Holds RUles for Swapping one component into another component';

alter table "FenixBuilder"."TCRuleSwap"
    owner to postgres;

COMMIT;