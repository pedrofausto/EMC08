# merge all tests into a new test

# load the test
 load_test tmr0_cov_test tmr1_cov_test

# union all tests into a new testunion tap_test_merge
  
# load the test
 load_test tap_test_merge

# report HTML coverage merge by module for all modules
  report_html -be -both -module * > /home/student/EMC08/digital_A/timers/verification/reports/report_detail_module.html

# report summary coverage by instance for all instances
  report_summary -be -instance *... > /home/student/EMC08/digital_A/timers/verification/reports/report_summary-instance.log

# report tabular coverage by module for all modules
  report_tabular -be -module * > /home/student/EMC08/digital_A/timers/verification/reports/report_tabular-module.log

# report detail coverage (covered and uncovered) by module for all modules
  report_detail -be -both -instance *... > /home/student/EMC08/digital_A/timers/verification/reports/report_detail-module.log

# quit
  quit
