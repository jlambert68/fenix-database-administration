-- *******************************************************************************************************************
NOT CHECKED
create table "TestCaseExecutionStatusEnum"
(
    "gRPC_Id"   integer not null
        primary key,
    "gRPC_Name" varchar not null
        unique
);

comment on table "TestCaseExecutionStatusEnum" is 'Holds all status values for TestCase executions';

alter table "TestCaseExecutionStatusEnum"
    owner to postgres;

grant delete, insert, select, update on "TestCaseExecutionStatusEnum" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "ExecutionStatusReportLevelEnum"
(
    "gRPC_Id"             integer not null
        primary key,
    "gRPC_Id_Description" varchar not null
);

comment on table "ExecutionStatusReportLevelEnum" is 'Holds the definitions for the differentReporting Levels';

alter table "ExecutionStatusReportLevelEnum"
    owner to postgres;

grant delete, insert, select, update on "ExecutionStatusReportLevelEnum" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestInstructionsUnderExecution"
(
    "DomainUuid"                                 uuid                     not null,
    "DomainName"                                 varchar                  not null,
    "TestInstructionExecutionUuid"               uuid                     not null
        constraint "SentTestInstructionsForExecution_pkey"
            primary key,
    "MatureTestInstructionUuid"                  uuid                     not null,
    "TestInstructionName"                        varchar                  not null,
    "TestInstructionMajorVersionNumber"          integer                  not null,
    "TestInstructionMinorVersionNumber"          integer                  not null,
    "SentTimeStamp"                              timestamp with time zone not null,
    "ExpectedExecutionDuration"                  timestamp with time zone,
    "ExpectedExecutionEndTimeStamp"              timestamp with time zone,
    "TestInstructionExecutionStatus"             integer                  not null,
    "ExecutionStatusUpdateTimeStamp"             timestamp with time zone not null,
    "TestDataSetUuid"                            uuid                     not null,
    "TestCaseExecutionUuid"                      uuid                     not null,
    "TestCaseExecutionVersion"                   integer                  not null,
    "TestInstructionInstructionExecutionVersion" integer                  not null,
    "TestInstructionCanBeReExecuted"             boolean default true     not null,
    "TestInstructionExecutionOrder"              integer                  not null,
    "UniqueCounter"                              serial
        unique,
    "TestInstructionOriginalUuid"                uuid                     not null,
    "TestInstructionExecutionEndTimeStamp"       timestamp with time zone,
    "TestInstructionExecutionHasFinished"        boolean                  not null,
    "QueueTimeStamp"                             timestamp with time zone,
    "ExecutionPriority"                          integer,
    "TestInstructionExecutionResendCounter"      integer default 0,
    "ExecutionStatusReportLevel"                 integer                  not null
        constraint testinstructionsunderexecution_executionstatusreportlevelenum_g
            references "ExecutionStatusReportLevelEnum",
    "ExecutionDomainUuid"                        uuid                     not null,
    "ExecutionDomainName"                        varchar                  not null
);

comment on table "TestInstructionsUnderExecution" is 'Holds all TestInstructions sent to client system for execution';

alter table "TestInstructionsUnderExecution"
    owner to postgres;

grant select, usage on sequence "TestInstructionsUnderExecution_UniqueCounter_seq" to "fenix-cloudrun-dbuser";

grant delete, insert, select, update on "TestInstructionsUnderExecution" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestInstructionAttributesUnderExecution"
(
    "TestInstructionExecutionUuid"     uuid    not null,
    "TestInstructionAttributeType"     integer not null,
    "TestInstructionAttributeUuid"     uuid    not null,
    "TestInstructionAttributeName"     varchar not null,
    "AttributeValueAsString"           varchar,
    "AttributeValueUuid"               uuid,
    "TestInstructionAttributeTypeUuid" uuid    not null,
    "TestInstructionAttributeTypeName" varchar not null,
    constraint senttestinstructionattributesforexecution_pk
        unique ("TestInstructionExecutionUuid", "TestInstructionAttributeUuid")
);

comment on table "TestInstructionAttributesUnderExecution" is 'Holds all attributes that is sent for execution ';

alter table "TestInstructionAttributesUnderExecution"
    owner to postgres;

grant delete, insert, select, update on "TestInstructionAttributesUnderExecution" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestInstructionExecutionStatusEnum"
(
    "gRPC_Id"   integer not null
        primary key,
    "gRPC_Name" varchar not null
        unique
);

comment on table "TestInstructionExecutionStatusEnum" is 'Valid execution status for TestInstructions';

alter table "TestInstructionExecutionStatusEnum"
    owner to postgres;

grant delete, insert, select, update on "TestInstructionExecutionStatusEnum" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "ProcessingCapabilityForClientSystemEnum"
(
    "gRPC_Id"   integer not null
        primary key,
    "gRPC_Name" varchar not null
        unique
);

comment on table "ProcessingCapabilityForClientSystemEnum" is 'Holds execution capabilities that client client can have';

alter table "ProcessingCapabilityForClientSystemEnum"
    owner to postgres;

grant delete, insert, select, update on "ProcessingCapabilityForClientSystemEnum" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "ProcessingCapabilityForClientSystem"
(
    "DomainUuid"                          uuid      not null
        unique,
    "DomainName"                          varchar   not null,
    "TestInstructionProcessingCapability" integer   not null,
    "TestCaseProcessingCapability"        integer   not null,
    "TestSuiteProcessingCapability"       integer,
    "UpdatedTimeStamp"                    timestamp not null
);

comment on table "ProcessingCapabilityForClientSystem" is 'Holds the clients execution capabilities for all execution clients';

alter table "ProcessingCapabilityForClientSystem"
    owner to postgres;

grant delete, insert, select, update on "ProcessingCapabilityForClientSystem" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "LogPostStatusEnum"
(
    "gRPC_Id"   integer not null
        primary key,
    "gRPC_Name" varchar not null
        unique
);

comment on table "LogPostStatusEnum" is 'Holds the different typings for logposts from clients executions ';

alter table "LogPostStatusEnum"
    owner to postgres;

grant delete, insert, select, update on "LogPostStatusEnum" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestInstructionAttributeTypeEnum"
(
    "gRPC_Id"   integer not null
        unique,
    "gRPC_Name" varchar not null
        unique
);

comment on table "TestInstructionAttributeTypeEnum" is 'Holds the types of attributes that is supported';

alter table "TestInstructionAttributeTypeEnum"
    owner to postgres;

grant delete, insert, select, update on "TestInstructionAttributeTypeEnum" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "ExecutionPriorityEnum"
(
    "PriorityId"          integer not null
        primary key,
    "PriorityName"        varchar not null,
    "PriorityDescription" varchar not null
);

comment on table "ExecutionPriorityEnum" is 'Holds the different execution priority used by the execution engine';

alter table "ExecutionPriorityEnum"
    owner to postgres;

grant delete, insert, select, update on "ExecutionPriorityEnum" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestInstructionExecutionQueue"
(
    "DomainUuid"                        uuid                     not null,
    "DomainName"                        varchar                  not null,
    "TestInstructionExecutionUuid"      uuid                     not null
        primary key,
    "MatureTestInstructionUuid"         uuid                     not null,
    "TestInstructionName"               varchar                  not null,
    "TestInstructionMajorVersionNumber" integer                  not null,
    "TestInstructionMinorVersionNumber" integer                  not null,
    "QueueTimeStamp"                    timestamp with time zone not null,
    "ExecutionPriority"                 integer                  not null
        constraint testinstructionexecutionqueue_executionpriorityenum_priorityid_
            references "ExecutionPriorityEnum",
    "TestCaseExecutionUuid"             uuid                     not null,
    "TestDataSetUuid"                   uuid                     not null,
    "TestCaseExecutionVersion"          integer                  not null,
    "TestInstructionExecutionVersion"   integer                  not null,
    "TestInstructionExecutionOrder"     integer                  not null,
    "UniqueCounter"                     serial
        unique,
    "TestInstructionOriginalUuid"       uuid                     not null,
    "ExecutionStatusReportLevel"        integer                  not null
        constraint testinstructionexecutionqueue_executionstatusreportlevelenum_gr
            references "ExecutionStatusReportLevelEnum",
    "ExecutionDomainUuid"               uuid                     not null,
    "ExecutionDomainName"               varchar                  not null
);

comment on table "TestInstructionExecutionQueue" is 'All TestInstructions to be sent for Execution';

alter table "TestInstructionExecutionQueue"
    owner to postgres;

grant select, usage on sequence "TestInstructionExecutionQueue_UniqueCounter_seq" to "fenix-cloudrun-dbuser";

grant delete, insert, select, update on "TestInstructionExecutionQueue" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestCaseExecutionTestData"
(
    "TestCaseExecutionUuid"                   uuid    not null,
    "TestDataSetUuid"                         uuid    not null,
    "ManualOverrideTestDataSetAttributeUuid"  uuid    not null,
    "ManualOverrideTestDataSetAttributeName"  varchar not null,
    "ManualOverrideTestDataSetAttributeValue" varchar not null
);

comment on table "TestCaseExecutionTestData" is 'Holds the Testdata used for the TestExecution';

alter table "TestCaseExecutionTestData"
    owner to postgres;

grant delete, insert, select, update on "TestCaseExecutionTestData" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "LatestTestSuiteAndTestCaseExecutionVersions"
(
    "TestSuiteExecutionUuid"    uuid    not null,
    "TestCaseExecutionUuid"     uuid    not null,
    "TestSuiteExecutionVersion" integer not null,
    "TestCaseExecutionVersion"  integer not null
);

comment on table "LatestTestSuiteAndTestCaseExecutionVersions" is 'Holds the latest combination of identity and execution identity';

alter table "LatestTestSuiteAndTestCaseExecutionVersions"
    owner to postgres;

grant delete, insert, select, update on "LatestTestSuiteAndTestCaseExecutionVersions" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestCasesUnderExecution"
(
    "DomainUuid"                     uuid                     not null,
    "DomainName"                     varchar                  not null,
    "TestSuiteUuid"                  uuid                     not null,
    "TestSuiteName"                  varchar                  not null,
    "TestSuiteVersion"               integer                  not null,
    "TestSuiteExecutionUuid"         uuid                     not null,
    "TestSuiteExecutionVersion"      integer                  not null,
    "TestCaseUuid"                   uuid                     not null,
    "TestCaseName"                   varchar                  not null,
    "TestCaseVersion"                integer                  not null,
    "TestCaseExecutionUuid"          uuid                     not null,
    "TestCaseExecutionVersion"       integer                  not null,
    "QueueTimeStamp"                 timestamp with time zone not null,
    "TestDataSetUuid"                uuid                     not null,
    "ExecutionPriority"              integer                  not null
        constraint testcaseexecutionqueue_executionpriorityenum_priorityid_fk
            references "ExecutionPriorityEnum",
    "ExecutionStartTimeStamp"        timestamp with time zone,
    "ExecutionStopTimeStamp"         timestamp with time zone,
    "TestCaseExecutionStatus"        integer
        constraint testcaseexecutionqueue_testcaseexecutionstatusenum_grpc_id_fk
            references "TestCaseExecutionStatusEnum",
    "ExecutionHasFinished"           boolean                  not null,
    "UniqueCounter"                  serial
        unique,
    "ExecutionStatusUpdateTimeStamp" timestamp with time zone,
    "ExecutionStatusReportLevel"     integer                  not null
        constraint testcasesunderexecution_executionstatusreportlevelenum_grpc_id_
            references "ExecutionStatusReportLevelEnum"
);

comment on table "TestCasesUnderExecution" is 'Holds TestCases that are under execution';

alter table "TestCasesUnderExecution"
    owner to postgres;

grant select, usage on sequence "TestCasesUnderExecution_UniqueCounter_seq" to "fenix-cloudrun-dbuser";

grant delete, insert, select, update on "TestCasesUnderExecution" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestCasesFinishedExecution"
(
    "DomainUuid"                     uuid                     not null,
    "DomainName"                     varchar                  not null,
    "TestSuiteUuid"                  uuid                     not null,
    "TestSuiteName"                  varchar                  not null,
    "TestSuiteVersion"               integer                  not null,
    "TestSuiteExecutionUuid"         uuid                     not null,
    "TestSuiteExecutionVersion"      integer                  not null,
    "TestCaseUuid"                   uuid                     not null,
    "TestCaseName"                   varchar                  not null,
    "TestCaseVersion"                integer                  not null,
    "TestCaseExecutionUuid"          uuid                     not null,
    "TestCaseExecutionVersion"       integer                  not null,
    "QueueTimeStamp"                 timestamp with time zone not null,
    "TestDataSetUuid"                uuid                     not null,
    "ExecutionPriority"              integer                  not null
        constraint testcaseexecutionqueue_executionpriorityenum_priorityid_fk
            references "ExecutionPriorityEnum",
    "ExecutionStartTimeStamp"        timestamp with time zone,
    "ExecutionStopTimeStamp"         timestamp with time zone,
    "TestCaseExecutionStatus"        integer
        constraint testcaseexecutionqueue_testcaseexecutionstatusenum_grpc_id_fk
            references "TestCaseExecutionStatusEnum",
    "ExecutionHasFinished"           boolean                  not null,
    "UniqueCounter"                  serial
        unique,
    "ExecutionStatusUpdateTimeStamp" timestamp with time zone,
    "ExecutionStatusReportLevel"     integer                  not null
        constraint testcasesfinishedexecution_executionstatusreportlevelenum_grpc_
            references "ExecutionStatusReportLevelEnum"
);

comment on table "TestCasesFinishedExecution" is 'Holds all TestCases that has finished their executions, independent of outcome';

alter table "TestCasesFinishedExecution"
    owner to postgres;

grant select, usage on sequence "TestCasesFinishedExecution_UniqueCounter_seq" to "fenix-cloudrun-dbuser";

grant delete, insert, select, update on "TestCasesFinishedExecution" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "DomainParameters"
(
    "DomainUuid"              uuid    not null
        primary key,
    "DomainName"              varchar not null,
    "ExecutionWorker Address" varchar not null
        unique
);

comment on table "DomainParameters" is 'Hold parameters for the DOmains';

alter table "DomainParameters"
    owner to postgres;

grant delete, insert, select, update on "DomainParameters" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestInstructionExecutionMessagesReceivedByWrongExecutionInstanc"
(
    "ApplicationExecutionRuntimeUuid" uuid,
    "TestInstructionExecutionUuid"    uuid      not null,
    "TestInstructionExecutionVersion" integer   not null,
    "TimeStamp"                       timestamp not null,
    "MessageType"                     integer   not null,
    "MessageAsJsonb"                  jsonb     not null
);

comment on table "TestInstructionExecutionMessagesReceivedByWrongExecutionInstanc" is 'Temporary holds TestInstructionExecution-data that is handled by other Execution-instance';

alter table "TestInstructionExecutionMessagesReceivedByWrongExecutionInstanc"
    owner to postgres;

grant delete, insert, select, update on "TestInstructionExecutionMessagesReceivedByWrongExecutionInstanc" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "TestCaseExecutionQueue"
(
    "DomainUuid"                 uuid                     not null,
    "DomainName"                 varchar                  not null,
    "TestSuiteUuid"              uuid,
    "TestSuiteName"              varchar,
    "TestSuiteVersion"           integer,
    "TestSuiteExecutionUuid"     uuid                     not null,
    "TestSuiteExecutionVersion"  integer,
    "TestCaseUuid"               uuid                     not null,
    "TestCaseName"               varchar                  not null,
    "TestCaseVersion"            integer                  not null,
    "TestCaseExecutionUuid"      uuid                     not null,
    "TestCaseExecutionVersion"   integer                  not null,
    "QueueTimeStamp"             timestamp with time zone not null,
    "TestDataSetUuid"            uuid                     not null,
    "ExecutionPriority"          integer                  not null
        constraint testcaseexecutionqueue_executionpriorityenum_priorityid_fk
            references "ExecutionPriorityEnum",
    "UniqueCounter"              serial
        unique,
    "ExecutionStatusReportLevel" integer                  not null
        constraint testcaseexecutionqueue_executionstatusreportlevelenum_grpc_id_f
            references "ExecutionStatusReportLevelEnum"
);

comment on table "TestCaseExecutionQueue" is 'Holds TestCases that are waiting to be executed execution';

alter table "TestCaseExecutionQueue"
    owner to postgres;

grant select, usage on sequence "TestCaseExecutionQueue_UniqueCounter_seq" to "fenix-cloudrun-dbuser";

grant delete, insert, select, update on "TestCaseExecutionQueue" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "ResponseVariablesFinishedExecution"
(
    "Identifier"                      uuid      not null
        constraint responsevariablesfinishedexecution_pk
            primary key,
    "UniqueRowCounter"                serial,
    "TestInstructionExecutionUuid"    uuid      not null,
    "TestInstructionExecutionVersion" integer   not null,
    "ResponseVariableUuid"            uuid      not null,
    "ResponseVariableName"            varchar   not null,
    "ResponseVariableTypeUuid"        uuid      not null,
    "ResponseVariableTypeName"        varchar   not null,
    "ResponseVariableValueAsString"   varchar,
    "InsertedTimeStamp"               timestamp not null
);

alter table "ResponseVariablesFinishedExecution"
    owner to postgres;

-- *******************************************************************************************************************
NOT CHECKED
create table "ExecutionLogPosts"
(
    "DomainUuid"                      uuid      not null,
    "TestCaseExecutionUuid"           uuid      not null,
    "TestCaseExecutionVersion"        integer   not null,
    "TestInstructionExecutionUuid"    uuid      not null,
    "TestInstructionExecutionVersion" integer   not null,
    "TestInstructionExecutionStatus"  integer
        constraint executionlogposts_testcaseexecutionstatusenum_grpc_id_fk
            references "TestCaseExecutionStatusEnum",
    "LogPostUuid"                     uuid      not null
        primary key,
    "LogPostTimeStamp"                timestamp not null,
    "LogPostStatus"                   integer
        constraint executionlogposts_logpoststatusenum_grpc_id_fk
            references "LogPostStatusEnum",
    "LogPostText"                     varchar,
    "FoundVsExpectedValuesAsJsonb"    jsonb     not null
);

comment on table "ExecutionLogPosts" is 'Holds all execution log posts produced by execution clients';

alter table "ExecutionLogPosts"
    owner to postgres;

grant delete, insert, select, update on "ExecutionLogPosts" to "fenix-cloudrun-dbuser";

-- *******************************************************************************************************************
NOT CHECKED
create table "ResponseVariablesUnderExecution"
(
    "UniqueUuid"                      uuid      not null
        constraint responsevariablesunderexecution_pk
            primary key,
    "DomainUuid"                      uuid      not null,
    "TestCaseExecutionUuid"           uuid      not null,
    "TestCaseExecutionVersion"        integer   not null,
    "TestInstructionExecutionUuid"    uuid      not null,
    "TestInstructionExecutionVersion" integer   not null,
    "ResponseVariableUuid"            uuid      not null,
    "ResponseVariableName"            varchar   not null,
    "ResponseVariableTypeUuid"        uuid      not null,
    "ResponseVariableTypeName"        varchar   not null,
    "ResponseVariableValueAsString"   varchar   not null,
    "InsertedTimeStamp"               timestamp not null,
    "MatureTestInstructionUuid"       uuid      not null
);

alter table "ResponseVariablesUnderExecution"
    owner to postgres;

grant delete, insert, select, update on "ResponseVariablesUnderExecution" to "fenix-cloudrun-dbuser";

