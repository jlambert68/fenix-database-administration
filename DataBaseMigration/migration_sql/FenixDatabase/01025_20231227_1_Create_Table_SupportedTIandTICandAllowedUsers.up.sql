-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

-- Create the SupportedTIAndTICAndAllowedUsers-table
CREATE TABLE IF NOT EXISTS "FenixBuilder"."SupportedTIAndTICAndAllowedUsers"
(
    domainuuid                                                 uuid      not null
        constraint supportedtiandticandallowedusers_pk
            primary key
        constraint supportedtiandticandallowedusers_domains_domain_uuid_fk
            references "FenixDomainAdministration".domains,
    domainname                                                 varchar   not null,
    messagehash                                                varchar   not null,
    testinstructionshash                                       varchar   not null,
    testinstructioncontainershash                              varchar   not null,
    allowedusershash                                           varchar   not null,
    supportedtiandticandallowedusersmessageasjsonb             jsonb     not null,
    updatedtimestamp                                           timestamp not null,
    lastpublishedtimestamp                                     timestamp not null,
    canlistandviewtestcaseownedbythisdomain                    bigint    not null,
    canbuildandsavetestcaseownedbythisdomain                   bigint    not null,
    canlistandviewtestcasehavingtiandticfromthisdomain         bigint    not null,
    canlistandviewtestcasehavingtiandticfromthisdomainextended bigint    not null,
    canbuildandsavetestcasehavingtiandticfromthisdomain        bigint    not null
);

comment on table "FenixBuilder"."SupportedTIAndTICAndAllowedUsers" is 'All supported TestInstructions and TestInstructionContainers and Allowed Users for specific Domain';

alter table "FenixBuilder"."SupportedTIAndTICAndAllowedUsers"
    owner to postgres;

COMMIT ;
