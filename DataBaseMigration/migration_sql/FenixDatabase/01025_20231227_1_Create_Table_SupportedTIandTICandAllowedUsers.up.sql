-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

-- Create the SupportedTIAndTICAndAllowedUsers-table
CREATE TABLE IF NOT EXISTS "FenixBuilder"."SupportedTIAndTICAndAllowedUsers"
(
    DomainUUID                                     uuid      not null
        constraint supportedtiandticandallowedusers_pk
            primary key
        constraint supportedtiandticandallowedusers_domains_domain_uuid_fk
            references "FenixDomainAdministration".domains,
    DomainName                                     varchar   not null,
    MessageHash                                    varchar   not null,
    TestInstructionsHash                           varchar   not null,
    TestInstructionContainersHash                  varchar   not null,
    allowedusershash                               varchar   not null,
    SupportedTIAndTICAndAllowedUsersMessageAsJsonb jsonb     not null,
    UpdatedTimeStamp                               timestamp not null,
    LastPublishedTimeStamp                         timestamp not null
);

comment on table "FenixBuilder"."SupportedTIAndTICAndAllowedUsers" is 'All supported TestInstructions and TestInstructionContainers and Allowed Users for specific Domain';

alter table "FenixBuilder"."SupportedTIAndTICAndAllowedUsers"
    owner to postgres;

COMMIT ;
