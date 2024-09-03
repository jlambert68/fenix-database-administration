-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

create table "FenixBuilder"."TemplateRepositoryConnectionParameters"
(
    "DomainUuid"           uuid    not null
        constraint templaterepositoryconnectionparameters_domains_domain_uuid_fk
            references "FenixDomainAdministration".domains,
    "DomainName"           varchar not null,
    "RepositoryApiUrl"     varchar not null,
    "RepositoryOwner"      varchar not null,
    "RepositoryName"       varchar not null,
    "RepositoryPath"       varchar not null,
    "GitHubApiKey"         varchar not null,
    "UpdateTimeStamp"      timestamp,
    "RepositoryApiUrlName" varchar not null
);

comment on table "FenixBuilder"."TemplateRepositoryConnectionParameters" is 'Holds the parameters for TesterGui to be able to import templates from Github';

alter table "FenixBuilder"."TemplateRepositoryConnectionParameters"
    owner to postgres;

COMMIT ;





