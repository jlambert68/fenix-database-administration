-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

-- Create the AllowedUsers-table
CREATE TABLE IF NOT EXISTS "FenixDomainAdministration"."allowedusers"
(
    uniqueidhash                                               varchar not null
        constraint allowedusers_pk
            primary key,
    domainuuid                                                 uuid    not null
        constraint allowedusers_domains_domain_uuid_fk
            references domains,
    domainname                                                 varchar not null,
    useridoncomputer                                           varchar not null,
    gcpauthenticateduser                                       varchar not null,
    useremail                                                  varchar not null,
    userfirstname                                              varchar not null,
    userlastname                                               varchar not null,
    canlistandviewtestcaseownedbythisdomain                    bigint  not null,
    canbuildandsavetestcaseownedbythisdomain                   bigint  not null,
    canlistandviewtestcasehavingtiandticfromthisdomain         bigint  not null,
    canlistandviewtestcasehavingtiandticfromthisdomainextended bigint  not null,
    canbuildandsavetestcasehavingtiandticfromthisdomain        bigint  not null
);

comment on table "FenixDomainAdministration".allowedusers is 'Each Domain send its allowed users which are stored here';

comment on column "FenixDomainAdministration".allowedusers.uniqueidhash is 'The Hash of concat(DomainUUID, UserIdOnComputer, GCPAuthenticatedUser)';

alter table "FenixDomainAdministration"."allowedusers"
    owner to postgres;

COMMIT ;
