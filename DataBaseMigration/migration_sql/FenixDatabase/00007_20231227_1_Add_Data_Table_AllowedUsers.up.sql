-- noinspection SqlNoDataSourceInspectionForFile

BEGIN;

-- Add values too the Domains-tables
insert into "FenixDomainAdministration"."allowedusers" (uniqueidhash, domainuuid, domainname, useridoncomputer, gcpauthenticateduser, useremail, userfirstname, userlastname, canlistandviewtestcaseownedbythisdomain, canbuildandsavetestcaseownedbythisdomain, canlistandviewtestcasehavingtiandticfromthisdomain, canlistandviewtestcasehavingtiandticfromthisdomainextended, canbuildandsavetestcasehavingtiandticfromthisdomain)
values  ('3f229db69a50444819bdc3b649f45109441429d1af7c383c384e57514f98e10a', '16458c6c-4f4f-4011-8bd6-34750490c8c1', 'OnPremDemo', 'jlambert', 'jonas.lambert68@gmail.com', 'jonas.lambert@drakon.se', 'Jonas', 'Lambert', 2, 2, 2, 2, 2),
        ('1c270036cfb38136e4f7fce5a4eb109293b5adc585e867c015ac860b6ff80db4', '16458c6c-4f4f-4011-8bd6-34750490c8c1', 'OnPremDemo', 'jlambert', 'jonas.lambert@seb.se', 'jonas.lambert@seb.se', 'Jonas', 'Lambert', 2, 0, 2, 0, 0),
        ('991eb744ee687f7b24d850b7317b5cc6dbc5656396d341fdcfe57ad4d790b4c0', '7edf2269-a8d3-472c-aed6-8cdcc4a8b6ae', 'SubCustody', 'jlambert', 'jonas.lambert68@gmail.com', 'jonas.lambert@drakon.se', 'Jonas', 'Lambert', 8, 8, 8, 8, 8),
        ('abe634296e3475207d72122a8c53ef643b868269e5fa16bc76b74e88f34835bc', '7edf2269-a8d3-472c-aed6-8cdcc4a8b6ae', 'SubCustody', 'jlambert', 'jonas.lambert@seb.se', 'jonas.lambert@seb.se', 'Jonas', 'Lambert', 8, 0, 8, 0, 0);
COMMIT ;
