-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

-- Add values too the Domains-tables
insert into "FenixDomainAdministration"."domainbitpositionenum" (bitnumbername, bitnumbervalue)
values  ('bitposition_0', 1),
        ('bitposition_1', 2),
        ('bitposition_2', 4),
        ('bitposition_3', 8),
        ('bitposition_4', 16),
        ('bitposition_5', 32),
        ('bitposition_6', 64),
        ('bitposition_7', 128),
        ('bitposition_8', 256),
        ('bitposition_9', 512),
        ('bitposition_10', 1024),
        ('bitposition_11', 2048),
        ('bitposition_12', 4096),
        ('bitposition_13', 8192),
        ('bitposition_14', 16384),
        ('bitposition_15', 32768),
        ('bitposition_16', 65536),
        ('bitposition_17', 131072),
        ('bitposition_18', 262144),
        ('bitposition_19', 524288),
        ('bitposition_20', 1048576),
        ('bitposition_21', 2097152),
        ('bitposition_22', 4194304),
        ('bitposition_23', 8388608),
        ('bitposition_24', 16777216),
        ('bitposition_25', 33554432),
        ('bitposition_26', 67108864),
        ('bitposition_27', 134217728),
        ('bitposition_28', 268435456),
        ('bitposition_29', 536870912),
        ('bitposition_30', 1073741824),
        ('bitposition_31', 2147483648);
COMMIT ;
