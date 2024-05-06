INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('B0_BOND', 'Bond with zero connection. This is the base for any TestCase: "B0"', 1);
INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('B1f_BOND_NONE_SWAPPABLE', 'Bond with one connection. Use for starting a TestCase and is only found in pre-created TestInstructionContainers', 2);
INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('B1l_BOND_NONE_SWAPPABLE', 'Bond with one connection. Use for ending a TestCase and is only found in pre-created TestInstructionContainers', 3);
INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('B10_BOND', 'Bond with zero connections which appear as an element in a new', 4);
INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('B11f_BOND', 'Bond with one connection which appear as first element inside a TestInstructionContainer', 5);
INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('B11l_BOND', 'Bond with one connection which appear as last element inside a TestInstructionContainer', 6);
INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('B12_BOND', 'Bond with two connections which connects TestInstructions or TestInstructionContainers', 7);
INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('B10oxo_BOND', 'Bond with zero connections. This Bond is used in Pre-created containers and is used when user swap TIC(B10*x*) into TIC(B11fx-n-B11lx).', 8);
INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('B10ox_BOND', 'Bond with zero connections. This Bond is used in Pre-created containers and is used when user swap TIC(B10*x) into TIC(B11fx-n-B11l).', 9);
INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('B10xo_BOND', 'Bond with zero connections. This Bond is used in Pre-created containers and is used when user swap TIC(B10x*) into TIC(B11f-n-B11lx).', 10);
INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('B11fx_BOND_NONE_SWAPPABLE', 'Bond with one connection which appear as first element inside a TestInstructionContainer. This Bond is used in Pre-created containers and is used to stop a user to add new TestInstructions or TestInstructionsContainers before(first) structure.', 11);
INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('B11lx_BOND_NONE_SWAPPABLE', 'Bond with two connections which connects TestInstructions or TestInstructionContainers. This Bond is used in Pre-created containers and is used to stop a user to add new TestInstructions or TestInstructionsContainers within a pre-created container.', 12);
INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('B12x_BOND_NONE_SWAPPABLE', 'Bond with two connections which connects TestInstructions or TestInstructionContainers. This Bond is used in Pre-created containers and is used to stop a user to add new TestInstructions or TestInstructionsContainers within a pre-created container.', 13);
INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('TI_TESTINSTRUCTION', 'TestInstruction', 14);
INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('TIx_TESTINSTRUCTION_NONE_REMOVABLE', 'A standard TestInstruction which can not be removed or swapped out by the user', 15);
INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('TIC_TESTINSTRUCTIONCONTAINER', 'TestInstructionContainer(X), where X is any valid structure. Children in TestExecutionContainer is executed in serial mode', 16);
INSERT INTO "FenixBuilder"."TestCaseModelElementTypes" ("TestCaseModelElementType", "TestCaseModelElementTypeDescription", "GrpcMappingId") VALUES ('TICx_TESTINSTRUCTIONCONTAINER_NONE_REMOVABLE', 'A standard TestInstructionContainer(X), where X is any valid structure, which can not be removed or swapped out by the user. Children in TestExecutionContainer is executed in serial mode', 17);
