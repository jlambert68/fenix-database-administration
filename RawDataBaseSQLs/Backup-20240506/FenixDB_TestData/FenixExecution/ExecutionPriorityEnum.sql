insert into FenixExecution.ExecutionPriorityEnum (PriorityId, PriorityName, PriorityDescription)
values  (3, 'HIGH_SINGLE_TESTSUITE', 'Used for execution of single TestSuite triggered by the user'),
        (2, 'HIGH_SINGLE_TESTCASE', 'Used for execution of single TestCases triggered by the user'),
        (4, 'MEDIUM_MULTIPLE_TESTCASES', 'Used for execution of multiple TestCases triggered by the user'),
        (6, 'LOW_SCHEDULED_TESTSUITES', 'Scheduled Suites use this priority'),
        (5, 'MEDIUM_MULTIPLE_TESTSUITES', 'Used for execution of Multiple TestSuites triggered by the user'),
        (1, 'HIGHEST_PROBES', 'Only triggered by system that need to trigger probes');