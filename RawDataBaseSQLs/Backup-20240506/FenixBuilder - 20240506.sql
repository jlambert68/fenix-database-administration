-- *******************************************************************************************************************
NOT CHECKED
create table "TestContainerChildType"
(
    "TestInstructionContainerChildType"        integer not null
        constraint testcontainerchildtype_pk
            unique,
    "TestInstructionContainerChildDescription" varchar not null
);

comment on table "TestContainerChildType" is 'Holds the different child-types that a TestInstructionContainer can have';

alter table "TestContainerChildType"
    owner to postgres;

grant delete, insert, select, update on "TestContainerChildType" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TCRulesDeletion"
(
    "DeletionRule" varchar not null
        constraint tcrulesdeletion_pk
            primary key
);

comment on table "TCRulesDeletion" is 'Hold all Deletion Rules for Building Block';

alter table "TCRulesDeletion"
    owner to postgres;

grant delete, insert, select, update on "TCRulesDeletion" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestInstructions"
(
    "DomainUuid"                   uuid      not null
        constraint testinstructions_domains_domain_uuid_fk
            references "FenixDomainAdministration".domains,
    "DomainName"                   varchar   not null,
    "TestInstructionUuid"          uuid      not null
        constraint testinstructions_pk
            primary key,
    "TestInstructionName"          varchar   not null,
    "TestInstructionTypeUuid"      uuid      not null,
    "TestInstructionTypeName"      varchar   not null,
    "TestInstructionDescription"   varchar   not null,
    "TestInstructionMouseOverText" varchar   not null,
    "Deprecated"                   boolean   not null,
    "Enabled"                      boolean   not null,
    "MajorVersionNumber"           integer   not null,
    "MinorVersionNumber"           integer   not null,
    "UpdatedTimeStamp"             timestamp not null
);

comment on table "TestInstructions" is 'Holds all TestInstructions';

alter table "TestInstructions"
    owner to postgres;

grant delete, insert, select, update on "TestInstructions" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TCRuleSwap"
(
    "SwapRule" varchar not null
        constraint tcruleswap_pk
            primary key
);

comment on table "TCRuleSwap" is 'Holds RUles for Swapping one component into another component';

alter table "TCRuleSwap"
    owner to postgres;

grant delete, insert, select, update on "TCRuleSwap" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestInstructionAttributeTypes"
(
    "TestInstructionAttributeType" varchar not null
        constraint testinstructionattributetypes_pk
            primary key
);

comment on table "TestInstructionAttributeTypes" is 'The TestInstructionAttribute can have one of the following types: \"TextBox\", \"ComboBox\", \"FileSelector\", \"FunctionSelector\"';

alter table "TestInstructionAttributeTypes"
    owner to postgres;

grant delete, insert, select, update on "TestInstructionAttributeTypes" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestCaseModelElementTypes"
(
    "TestCaseModelElementType"            varchar not null
        constraint testcasemodelelementtypes_pk
            primary key,
    "TestCaseModelElementTypeDescription" varchar not null,
    "GrpcMappingId"                       integer not null
);

comment on table "TestCaseModelElementTypes" is 'All TestCaseModel-elements';

alter table "TestCaseModelElementTypes"
    owner to postgres;

grant delete, insert, select, update on "TestCaseModelElementTypes" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestInstructionContainerExecutionTypes"
(
    "TestInstructionContainerExecutionType" varchar not null
        constraint testinstructioncontainerexecutiontypes_pk
            primary key,
    "GrpcMapping"                           integer not null
);

comment on table "TestInstructionContainerExecutionTypes" is 'How a TestInstructionContainer is processed, in serial  or in parallel';

alter table "TestInstructionContainerExecutionTypes"
    owner to postgres;

grant delete, insert, select, update on "TestInstructionContainerExecutionTypes" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "AttributeActionCommandEnum"
(
    "gRPC_Id"   integer not null
        primary key,
    "gRPC_Name" varchar not null
        unique
);

comment on table "AttributeActionCommandEnum" is 'Holds the different actions a DropZone-attribute can have';

alter table "AttributeActionCommandEnum"
    owner to postgres;

grant delete, insert, select, update on "AttributeActionCommandEnum" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestCases"
(
    "DomainUuid"                                                      uuid,
    "DomainName"                                                      varchar,
    "TestCaseUuid"                                                    uuid,
    "TestCaseName"                                                    varchar,
    "TestCaseVersion"                                                 integer,
    "TestCaseBasicInformationAsJsonb"                                 jsonb,
    "TestInstructionsAsJsonb"                                         jsonb not null,
    "TestInstructionContainersAsJsonb"                                jsonb not null,
    "UniqueCounter"                                                   serial,
    "TestCaseHash"                                                    varchar,
    "TestCaseExtraInformationAsJsonb"                                 jsonb,
    "CanListAndViewTestCaseAuthorizationLevelOwnedByDomain"           bigint,
    "CanListAndViewTestCaseAuthorizationLevelHavingTiAndTicWithDomai" bigint,
    "TestCaseIsDeleted"                                               boolean,
    constraint testcases_pk
        unique ("TestCaseUuid", "TestCaseVersion")
);

comment on table "TestCases" is 'Holds all TestCases as a JSONB-structure';

alter table "TestCases"
    owner to postgres;

grant select, usage on sequence "TestCases_UniqueCounter_seq" to "fenix-cloudrun-dbuser";

grant delete, insert, select, update on "TestCases" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestInstructionContainers"
(
    "DomainUuid"                            uuid      not null,
    "DomainName"                            varchar   not null,
    "TestInstructionContainerUuid"          uuid      not null
        constraint testinstructioncontainers_pk
            primary key,
    "TestInstructionContainerName"          varchar   not null,
    "TestInstructionContainerTypeUuid"      uuid      not null,
    "TestInstructionContainerTypeName"      varchar   not null,
    "TestInstructionContainerDescription"   varchar   not null,
    "TestInstructionContainerMouseOverText" varchar   not null,
    "Deprecated"                            boolean   not null,
    "Enabled"                               boolean   not null,
    "MajorVersionNumber"                    integer   not null,
    "MinorVersionNumber"                    integer   not null,
    "UpdatedTimeStamp"                      timestamp not null,
    "ChildrenIsParallelProcessed"           boolean   not null
);

alter table "TestInstructionContainers"
    owner to postgres;

grant delete, insert, select, update on "TestInstructionContainers" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "BasicTestInstructionInformation"
(
    "DomainUuid"                   uuid      not null,
    "DomainName"                   varchar   not null,
    "TestInstructionUuid"          uuid      not null
        constraint basictestinstructioninformation_pk_2
            primary key,
    "TestInstructionName"          varchar   not null,
    "TestInstructionTypeUuid"      uuid      not null,
    "TestInstructionTypeName"      varchar   not null,
    "Deprecated"                   boolean   not null,
    "MajorVersionNumber"           integer   not null,
    "MinorVersionNumber"           integer   not null,
    "UpdatedTimeStamp"             timestamp not null,
    "TestInstructionColor"         varchar   not null,
    "TCRuleDeletion"               varchar   not null
        constraint basictestinstructioninformation_tcrulesdeletion_deletionrule_fk
            references "TCRulesDeletion",
    "TCRuleSwap"                   varchar   not null
        constraint basictestinstructioninformation_tcruleswap_swaprule_fk
            references "TCRuleSwap",
    "TestInstructionDescription"   varchar   not null,
    "TestInstructionMouseOverText" varchar   not null,
    "Enabled"                      boolean   not null
);

comment on table "BasicTestInstructionInformation" is 'Table  holding Basic information for one TestInstruction';

alter table "BasicTestInstructionInformation"
    owner to postgres;

grant delete, insert, select, update on "BasicTestInstructionInformation" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "ImmatureBonds"
(
    "BondUuid"                              uuid      not null
        constraint immaturebonds_pk
            primary key,
    "BondName"                              varchar   not null,
    "BondDescription"                       varchar   not null,
    "BondMouseOverText"                     varchar   not null,
    "Deprecated"                            boolean   not null,
    "Enabled"                               boolean   not null,
    "Visible"                               boolean   not null,
    "BondColor"                             varchar   not null,
    "CanBeDeleted"                          boolean   not null,
    "CanBeSwappedOut"                       boolean   not null,
    "ShowBondAttributes"                    boolean   not null,
    "TCRuleDeletion"                        varchar   not null
        constraint immaturebonds_tcrulesdeletion_deletionrule_fk
            references "TCRulesDeletion",
    "TCRuleSwap"                            varchar   not null
        constraint immaturebonds_tcruleswap_swaprule_fk
            references "TCRuleSwap",
    "UpdatedTimeStamp"                      timestamp not null,
    "TestCaseModelElementType"              varchar   not null,
    "TestCaseModelElementTypeGrpcMappingId" integer   not null
);

comment on table "ImmatureBonds" is 'Message holding all immature bonds that can be used within the TestCase-model';

alter table "ImmatureBonds"
    owner to postgres;

grant delete, insert, select, update on "ImmatureBonds" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "BasicTestInstructionContainerInformation"
(
    "DomainUuid"                            uuid      not null,
    "DomainName"                            varchar   not null,
    "TestInstructionContainerUuid"          uuid      not null
        constraint basictestinstructioncontainerinformation_pk
            primary key,
    "TestInstructionContainerName"          varchar   not null,
    "TestInstructionContainerTypeUuid"      uuid      not null,
    "TestInstructionContainerTypeName"      varchar   not null,
    "Deprecated"                            boolean   not null,
    "MajorVersionNumber"                    integer   not null,
    "MinorVersionNumber"                    integer,
    "UpdatedTimeStamp"                      timestamp not null,
    "TestInstructionContainerColor"         varchar   not null,
    "TCRuleDeletion"                        varchar   not null
        constraint basictestinstructioncontainerinformation_tcrulesdeletion_deleti
            references "TCRulesDeletion",
    "TCRuleSwap"                            varchar   not null
        constraint basictestinstructioncontainerinformation_tcruleswap_swaprule_fk
            references "TCRuleSwap",
    "TestInstructionContainerDescription"   varchar   not null,
    "TestInstructionContainerMouseOverText" varchar   not null,
    "Enabled"                               boolean   not null,
    "TestInstructionContainerExecutionType" varchar   not null
        constraint basictestinstructioncontainerinformation_testinstructioncontain
            references "TestInstructionContainerExecutionTypes"
);

comment on table "BasicTestInstructionContainerInformation" is 'Holding Basic information for one TestInstructionContainer';

alter table "BasicTestInstructionContainerInformation"
    owner to postgres;

grant delete, insert, select, update on "BasicTestInstructionContainerInformation" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestInstructionAttributes"
(
    "DomainUuid"                                    uuid    not null,
    "DomainName"                                    varchar not null,
    "TestInstructionUuid"                           uuid    not null,
    "TestInstructionName"                           varchar not null,
    "TestInstructionAttributeUuid"                  uuid    not null
        unique,
    "TestInstructionAttributeName"                  varchar not null,
    "TestInstructionAttributeDescription"           varchar not null,
    "TestInstructionAttributeMouseOver"             varchar not null,
    "TestInstructionAttributeTypeUuid"              uuid    not null,
    "TestInstructionAttributeTypeName"              varchar not null,
    "TestInstructionAttributeValueAsString"         varchar,
    "TestInstructionAttributeValueUuid"             uuid,
    "TestInstructionAttributeVisible"               boolean not null,
    "TestInstructionAttributeEnabled"               boolean,
    "TestInstructionAttributeMandatory"             boolean,
    "TestInstructionAttributeVisibleInTestCaseArea" boolean,
    "TestInstructionAttributeIsDeprecated"          boolean,
    "TestInstructionAttributeInputMask"             varchar,
    "TestInstructionAttributeType"                  varchar
        constraint testinstructionattributes_testinstructionattributetypes_testins
            references "TestInstructionAttributeTypes"
);

comment on table "TestInstructionAttributes" is 'Holds alla attributes for all TestInstructions';

alter table "TestInstructionAttributes"
    owner to postgres;

grant delete, insert, select, update on "TestInstructionAttributes" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "ImmatureElementModelMessage"
(
    "DomainUuid"               uuid    not null,
    "DomainName"               varchar not null,
    "ImmatureElementUuid"      uuid    not null,
    "ImmatureElementName"      varchar not null,
    "PreviousElementUuid"      uuid    not null,
    "NextElementUuid"          uuid    not null,
    "FirstChildElementUuid"    uuid    not null,
    "ParentElementUuid"        uuid    not null,
    "TestCaseModelElementType" varchar not null
        constraint immatureelementmodelmessage_testcasemodelelementtypes_testcasem
            references "TestCaseModelElementTypes",
    "OriginalElementUuid"      uuid    not null,
    "TopImmatureElementUuid"   uuid    not null,
    "IsTopElement"             boolean not null
);

comment on table "ImmatureElementModelMessage" is 'Holding the model for Immature elements, e.g. TestInstructions and pre-created TestInstructionContainers';

alter table "ImmatureElementModelMessage"
    owner to postgres;

grant delete, insert, select, update on "ImmatureElementModelMessage" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestInstructionContainerChildren"
(
    "TestIntructionContainer" uuid    not null
        constraint testinstructioncontainerchildren_testinstructioncontainercontai
            references "TestInstructionContainers",
    "TestContainerChildUuid"  uuid    not null,
    "TestContainerChildType"  integer not null
        constraint testinstructioncontainerchildren_testcontainerchildtype_testins
            references "TestContainerChildType" ("TestInstructionContainerChildType")
);

comment on table "TestInstructionContainerChildren" is 'Holds the releation between a TestIntructionContainer and it''s children';

alter table "TestInstructionContainerChildren"
    owner to postgres;

grant delete, insert, select, update on "TestInstructionContainerChildren" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "PinnedTestInstructionsAndPreCreatedTestInstructionContainers"
(
    "UserId"     varchar   not null,
    "PinnedUuid" uuid      not null,
    "PinnedName" varchar   not null,
    "PinnedType" integer   not null
        constraint pinnedtestinstructionsandprecreatedtestinstructioncontainers_te
            references "TestContainerChildType" ("TestInstructionContainerChildType"),
    "TimeStamp"  timestamp not null,
    constraint pinnedtestinstructionsandprecreatedtestinstructioncontainers_pk
        unique ("UserId", "PinnedUuid")
);

comment on table "PinnedTestInstructionsAndPreCreatedTestInstructionContainers" is 'Holds all users pinned TestInstructions ans pre-created TestInstructionsContainers';

alter table "PinnedTestInstructionsAndPreCreatedTestInstructionContainers"
    owner to postgres;

grant delete, insert, select, update on "PinnedTestInstructionsAndPreCreatedTestInstructionContainers" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "ImmatureTestInstructionContainerMessage"
(
    "DomainUuid"                   uuid    not null,
    "DomainName"                   varchar not null,
    "TestInstructionContainerUuid" uuid    not null
        constraint immaturetestinstructioncontainermessage_pk
            primary key
        constraint immaturetestinstructioncontainermessage_basictestinstructioncon
            references "BasicTestInstructionContainerInformation",
    "TestInstructionContainerName" varchar not null,
    "DropZoneUuid"                 uuid    not null,
    "DropZoneName"                 varchar not null,
    "DropZoneDescription"          varchar not null,
    "DropZoneMouseOver"            varchar not null,
    "DropZoneColor"                varchar not null,
    "TestInstructionAttributeType" varchar not null
        constraint immaturetestinstructioncontainermessage_testinstructionattribut
            references "TestInstructionAttributeTypes",
    "TestInstructionAttributeUuid" uuid    not null,
    "TestInstructionAttributeName" varchar not null,
    "AttributeValueAsString"       varchar not null,
    "AttributeValueUuid"           uuid    not null,
    "FirstImmatureElementUuid"     uuid    not null
);

comment on table "ImmatureTestInstructionContainerMessage" is 'Holding one Immature TestInstruction which is Dragged n Dropped into the TestCase';

alter table "ImmatureTestInstructionContainerMessage"
    owner to postgres;

grant delete, insert, select, update on "ImmatureTestInstructionContainerMessage" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "ImmatureTestInstructionInformation"
(
    "DomainUuid"                   uuid    not null,
    "DomainName"                   varchar not null,
    "TestInstructionUuid"          uuid    not null
        constraint immaturetestinstructioninformation_basictestinstructioninformat
            references "BasicTestInstructionInformation",
    "TestInstructionName"          varchar not null,
    "DropZoneUuid"                 uuid    not null,
    "DropZoneName"                 varchar not null,
    "DropZoneDescription"          varchar not null,
    "DropZoneMouseOver"            varchar not null,
    "DropZoneColor"                varchar not null,
    "TestInstructionAttributeType" varchar
        constraint immaturetestinstructioninformation_testinstructionattributetype
            references "TestInstructionAttributeTypes",
    "TestInstructionAttributeUuid" uuid,
    "TestInstructionAttributeName" varchar,
    "AttributeValueAsString"       varchar,
    "AttributeValueUuid"           uuid,
    "FirstImmatureElementUuid"     uuid    not null,
    "AttributeActionCommand"       integer not null
        constraint immaturetestinstructioninformation_attributeactioncommandenum_g
            references "AttributeActionCommandEnum",
    constraint immaturetestinstructioninformation_pk
        unique ("TestInstructionUuid", "DropZoneUuid", "AttributeValueUuid")
);

comment on table "ImmatureTestInstructionInformation" is 'Holding the information about the Immature TestInstruction';

alter table "ImmatureTestInstructionInformation"
    owner to postgres;

grant delete, insert, select, update on "ImmatureTestInstructionInformation" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "SupportedTIAndTICAndAllowedUsers"
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

comment on table "SupportedTIAndTICAndAllowedUsers" is 'All supported TestInstructions and TestInstructionContainers and Allowed Users for specific Domain';

alter table "SupportedTIAndTICAndAllowedUsers"
    owner to postgres;

