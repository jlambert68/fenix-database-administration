-- *******************************************************************************************************************
NOT CHECKED
create table domainbitpositionenum
(
    bitnumbername  varchar not null
        constraint domainbitpositionenum_pk
            primary key,
    bitnumbervalue bigint
);

alter table domainbitpositionenum
    owner to postgres;

-- *******************************************************************************************************************
NOT CHECKED
create table domains
(
    domain_uuid                                                   uuid      not null
        constraint domains_pk
            primary key,
    domain_name                                                   varchar   not null,
    description                                                   varchar,
    activated                                                     boolean   not null,
    deleted                                                       boolean   not null,
    update_timestamp                                              timestamp not null,
    replaced_by_new_version                                       boolean   not null,
    domain_id                                                     integer   not null,
    domain_version                                                integer   not null,
    workeraddress                                                 varchar   not null
        constraint domains_pk_2
            unique,
    bitnumbername                                                 varchar
        constraint domains_pk_3
            unique
        constraint domains_domainbitpositionenum_bitnumbername_fk
            references domainbitpositionenum,
    "AllUsersCanListAndViewTestCaseHavingTIandTICFromThisDomain"  boolean   not null,
    "AllUsersCanBuildAndSaveTestCaseHavingTIandTICFromThisDomain" boolean   not null
);

comment on table domains is 'Domains that can call Fenix';

alter table domains
    owner to postgres;

grant delete, insert, select, update on domains to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table allowedusers
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

comment on table allowedusers is 'Each Domain send its allowed users which are stored here';

comment on column allowedusers.uniqueidhash is 'The Hash of concat(DomainUUID, UserIdOnComputer, GCPAuthenticatedUser)';

alter table allowedusers
    owner to postgres;

