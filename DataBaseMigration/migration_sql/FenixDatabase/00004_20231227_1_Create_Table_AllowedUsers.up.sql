-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

-- Create the AllowedUsers-table
CREATE TABLE IF NOT EXISTS "FenixDomainAdministration".AllowedUsers
(
    UniqueIdHash         varchar not null
        constraint AllowedUsers_pk
            primary key,
    DomainUUID           uuid    not null
        constraint AllowedUsers_domains_domain_uuid_fk
            references "FenixDomainAdministration".domains,
    DomainName           varchar not null,
    UserIdOnComputer     varchar not null,
    GCPAuthenticatedUser varchar not null,
    UserEmail            varchar not null,
    UserFirstName        varchar not null,
    UserLastName         varchar not null
);

comment on table "FenixDomainAdministration".AllowedUsers is 'Each Domain send its allowed users which are stored here';

comment on column "FenixDomainAdministration".AllowedUsers.UniqueIdHash is 'The Hash of concat(DomainUUID, UserIdOnComputer, GCPAuthenticatedUser)';

alter table "FenixDomainAdministration"."AllowedUsers"
    owner to postgres;

COMMIT ;
